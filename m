From: Keith Owens <kaos@ocs.com.au>
Date: Sat, 05 May 2001 11:57:23 +0000
Subject: kbuild problem with drivers/sound/Config.in
Message-Id: <marc-linux-sound-98906386711806@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Please cc: me, I am not on this list.

2.4.4/drivers/sound/Config.in has a circular dependency between
CONFIG_AEDSP16_SBPRO and CONFIG_AEDSP16_MSS.  This patch remove the
loop, it also replaces [ config = y or m ] with [ config != n ] which
is cleaner and faster.  Does this look right?  If so please copy to
Alan Cox or Linus.

Against 2.4.4.

Index: 4.1/drivers/sound/Config.in
--- 4.1/drivers/sound/Config.in Sun, 22 Apr 2001 08:26:07 +1000 kaos (linux-2.4/P/b/0_Config.in 1.4.1.1.1.2 644)
+++ 4.1(w)/drivers/sound/Config.in Sat, 05 May 2001 21:54:48 +1000 kaos (linux-2.4/P/b/0_Config.in 1.4.1.1.1.2 644)
@@ -7,7 +7,7 @@
 # Prompt user for primary drivers.
 
 dep_tristate '  C-Media PCI (CMI8338/8378)' CONFIG_SOUND_CMPCI $CONFIG_SOUND $CONFIG_PCI
-if [ "$CONFIG_SOUND_CMPCI" = "y" -o "$CONFIG_SOUND_CMPCI" = "m" ]; then
+if [ "$CONFIG_SOUND_CMPCI" != "n" ]; then
     bool '    Enable S/PDIF loop for CMI8738' CONFIG_SOUND_CMPCI_SPDIFLOOP
     bool '    Enable 4 channel mode for CMI8738' CONFIG_SOUND_CMPCI_4CH
     if [ "$CONFIG_SOUND_CMPCI_4CH" = "y" ]; then
@@ -31,7 +31,7 @@ fi
 dep_tristate '  Trident 4DWave DX/NX, SiS 7018 or ALi 5451 PCI Audio Core' CONFIG_SOUND_TRIDENT $CONFIG_SOUND
 
 dep_tristate '  Support for Turtle Beach MultiSound Classic, Tahiti, Monterey' CONFIG_SOUND_MSNDCLAS $CONFIG_SOUND
-if [ "$CONFIG_SOUND_MSNDCLAS" = "y" -o "$CONFIG_SOUND_MSNDCLAS" = "m" ]; then
+if [ "$CONFIG_SOUND_MSNDCLAS" != "n" ]; then
    if [ "$CONFIG_SOUND_MSNDCLAS" = "y" ]; then
      comment '  Compiled-in MSND Classic support requires firmware during compilation.'
      define_bool CONFIG_MSNDCLAS_HAVE_BOOT y
@@ -48,7 +48,7 @@ if [ "$CONFIG_SOUND_MSNDCLAS" = "y" ]; t
 fi
 
 dep_tristate '  Support for Turtle Beach MultiSound Pinnacle, Fiji' CONFIG_SOUND_MSNDPIN $CONFIG_SOUND
-if [ "$CONFIG_SOUND_MSNDPIN" = "y" -o "$CONFIG_SOUND_MSNDPIN" = "m" ]; then
+if [ "$CONFIG_SOUND_MSNDPIN" != "n" ]; then
    if [ "$CONFIG_SOUND_MSNDPIN" = "y" ]; then
      comment 'Compiled-in MSND Pinnacle support requires firmware during compilation.'
      define_bool CONFIG_MSNDPIN_HAVE_BOOT y
@@ -84,7 +84,7 @@ dep_tristate '  VIA 82C686 Audio Codec' 
 
 dep_tristate '  OSS sound modules' CONFIG_SOUND_OSS $CONFIG_SOUND
 
-if [ "$CONFIG_SOUND_OSS" = "y" -o "$CONFIG_SOUND_OSS" = "m" ]; then
+if [ "$CONFIG_SOUND_OSS" != "n" ]; then
    bool '      Verbose initialisation' CONFIG_SOUND_TRACEINIT
    bool '      Persistent DMA buffers' CONFIG_SOUND_DMAP
 
@@ -114,14 +114,14 @@ if [ "$CONFIG_SOUND_OSS" = "y" -o "$CONF
    dep_tristate '    MPU-401 support (NOT for SB16)' CONFIG_SOUND_MPU401 $CONFIG_SOUND_OSS
    dep_tristate '    NM256AV/NM256ZX audio support' CONFIG_SOUND_NM256 $CONFIG_SOUND_OSS
    dep_tristate '    OPTi MAD16 and/or Mozart based cards' CONFIG_SOUND_MAD16 $CONFIG_SOUND_OSS
-   if [ "$CONFIG_SOUND_MAD16" = "y" -o "$CONFIG_SOUND_MAD16" = "m" ]; then
+   if [ "$CONFIG_SOUND_MAD16" != "n" ]; then
      bool '      Support MIDI in older MAD16 based cards (requires SB)' CONFIG_MAD16_OLDCARD
    fi
    dep_tristate '    ProAudioSpectrum 16 support' CONFIG_SOUND_PAS $CONFIG_SOUND_OSS
    dep_bool '      Enable PAS16 joystick port' CONFIG_PAS_JOYSTICK $CONFIG_SOUND_PAS
 
    dep_tristate '    PSS (AD1848, ADSP-2115, ESC614) support' CONFIG_SOUND_PSS $CONFIG_SOUND_OSS
-   if [ "$CONFIG_SOUND_PSS" = "y" -o "$CONFIG_SOUND_PSS" = "m" ]; then
+   if [ "$CONFIG_SOUND_PSS" != "n" ]; then
       bool '      Enable PSS mixer (Beethoven ADSP-16 and other compatibile)' CONFIG_PSS_MIXER
       bool '      Have DSPxxx.LD firmware file' CONFIG_PSS_HAVE_BOOT
       if [ "$CONFIG_PSS_HAVE_BOOT" = "y" ]; then
@@ -148,24 +148,22 @@ if [ "$CONFIG_SOUND_OSS" = "y" -o "$CONF
    dep_tristate '    6850 UART support' CONFIG_SOUND_UART6850 $CONFIG_SOUND_OSS
   
    dep_tristate '    Gallant Audio Cards (SC-6000 and SC-6600 based)' CONFIG_SOUND_AEDSP16 $CONFIG_SOUND_OSS
-   if [ "$CONFIG_SOUND_AEDSP16" = "y" -o "$CONFIG_SOUND_AEDSP16" = "m" ]; then
+   if [ "$CONFIG_SOUND_AEDSP16" != "n" ]; then
       bool '      SC-6600 based audio cards (new Audio Excel DSP 16)' CONFIG_SC6600
       if [ "$CONFIG_SC6600" = "y" ]; then
          bool '        Activate SC-6600 Joystick Interface' CONFIG_SC6600_JOY
          int '        SC-6600 CDROM Interface (4=None, 3=IDE, 1=Panasonic, 0=?Sony?)' CONFIG_SC6600_CDROM 4
          hex '        SC-6600 CDROM Interface I/O Address' CONFIG_SC6600_CDROMBASE 0
       fi
-      if [ "$CONFIG_SOUND_SB" = "y" -o "$CONFIG_SOUND_SB" = "m" ]; then
-         if [ "$CONFIG_AEDSP16_MSS" != "y" ]; then
-            bool '      Audio Excel DSP 16 (SBPro emulation)' CONFIG_AEDSP16_SBPRO
-         fi
+      if [ "$CONFIG_SOUND_SB" != "n" ]; then
+	 bool '      Audio Excel DSP 16 (SBPro emulation)' CONFIG_AEDSP16_SBPRO
       fi
-      if [ "$CONFIG_SOUND_MSS" = "y" -o "$CONFIG_SOUND_MSS" = "m" ]; then
+      if [ "$CONFIG_SOUND_MSS" != "n" ]; then
          if [ "$CONFIG_AEDSP16_SBPRO" != "y" ]; then
             bool '      Audio Excel DSP 16 (MSS emulation)' CONFIG_AEDSP16_MSS
          fi
       fi
-      if [ "$CONFIG_SOUND_MPU401" = "y" -o "$CONFIG_SOUND_MPU401" = "m" ]; then
+      if [ "$CONFIG_SOUND_MPU401" != "n" ]; then
          bool '      Audio Excel DSP 16 (MPU401 emulation)' CONFIG_AEDSP16_MPU401
       fi
    fi

-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
