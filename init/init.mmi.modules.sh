#!/vendor/bin/sh

# All modules that depend on conditions or need extra parameters
# should go here.

insmod /vendor/lib/modules/adapter_class.ko
insmod /vendor/lib/modules/mmi_charger.ko
insmod /vendor/lib/modules/mmi_discrete_charger_class.ko
insmod /vendor/lib/modules/sgm4154x_charger.ko
insmod /vendor/lib/modules/bq2589x_charger.ko
insmod /vendor/lib/modules/sm5602_fg_mmi.ko
insmod /vendor/lib/modules/cw2217b_fg_mmi.ko
insmod /vendor/lib/modules/rt9426a_fg_mmi.ko
insmod /vendor/lib/modules/mmi_discrete_charger.ko
insmod /vendor/lib/modules/qpnp_adaptive_charge.ko
insmod /vendor/lib/modules/tcpc_class.ko
insmod /vendor/lib/modules/tcpc_sgm7220.ko
insmod /vendor/lib/modules/tcpc_aw35616.ko
insmod /vendor/lib/modules/rt_pd_manager.ko
insmod /vendor/lib/modules/chipone_tddi_v2_mmi.ko
insmod /vendor/lib/modules/nova_0flash_mmi.ko
insmod /vendor/lib/modules/aw9610x.ko
insmod /vendor/lib/modules/sx933x_sar.ko
insmod /vendor/lib/modules/ilitek_v3_mmi.ko

buildtype=$(getprop ro.build.type)
if [ $buildtype = "userdebug" ]; then
    insmod /vendor/lib/modules/watchdogtest.ko
fi
