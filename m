From: Rusty Trivial Russell <rusty@rustcorp.com.au>
Date: Tue, 10 Sep 2002 09:14:45 +0000
Subject: [TRIVIAL] designated initializer patches for include_sound
Message-Id: <marc-linux-sound-103165003521077@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[ Not sure who the maintainer for this/these is/are.  Please apply and forward to Linus ]

From:  Art Haas <ahaas@neosoft.com>

  Here are two patches for C99 designated initializers for
  files in include/sound. The patches are against 2.5.31.
  
  Art Haas
  -- 
  They that can give up essential liberty to obtain a little temporary
  safety deserve neither liberty nor safety.
   -- Benjamin Franklin, Historical Review of Pennsylvania, 1759

--- trivial-2.5.34/include/sound/ad1848.h.orig	2002-09-10 19:10:41.000000000 +1000
+++ trivial-2.5.34/include/sound/ad1848.h	2002-09-10 19:10:41.000000000 +1000
@@ -166,20 +166,20 @@
 void snd_ad1848_interrupt(int irq, void *dev_id, struct pt_regs *regs);
 
 #define AD1848_SINGLE(xname, xindex, reg, shift, mask, invert) \
-{ iface: SNDRV_CTL_ELEM_IFACE_MIXER, name: xname, index: xindex, \
-  info: snd_ad1848_info_single, \
-  get: snd_ad1848_get_single, put: snd_ad1848_put_single, \
-  private_value: reg | (shift << 8) | (mask << 16) | (invert << 24) }
+{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, .index = xindex, \
+  .info = snd_ad1848_info_single, \
+  .get = snd_ad1848_get_single, .put = snd_ad1848_put_single, \
+  .private_value = reg | (shift << 8) | (mask << 16) | (invert << 24) }
 
 int snd_ad1848_info_single(snd_kcontrol_t *kcontrol, snd_ctl_elem_info_t * uinfo);
 int snd_ad1848_get_single(snd_kcontrol_t * kcontrol, snd_ctl_elem_value_t * ucontrol);
 int snd_ad1848_put_single(snd_kcontrol_t * kcontrol, snd_ctl_elem_value_t * ucontrol);
 
 #define AD1848_DOUBLE(xname, xindex, left_reg, right_reg, shift_left, shift_right, mask, invert) \
-{ iface: SNDRV_CTL_ELEM_IFACE_MIXER, name: xname, index: xindex, \
-  info: snd_ad1848_info_double, \
-  get: snd_ad1848_get_double, put: snd_ad1848_put_double, \
-  private_value: left_reg | (right_reg << 8) | (shift_left << 16) | (shift_right << 19) | (mask << 24) | (invert << 22) }
+{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, .index = xindex, \
+  .info = snd_ad1848_info_double, \
+  .get = snd_ad1848_get_double, .put = snd_ad1848_put_double, \
+  .private_value = left_reg | (right_reg << 8) | (shift_left << 16) | (shift_right << 19) | (mask << 24) | (invert << 22) }
 
 int snd_ad1848_info_double(snd_kcontrol_t *kcontrol, snd_ctl_elem_info_t * uinfo);
 int snd_ad1848_get_double(snd_kcontrol_t * kcontrol, snd_ctl_elem_value_t * ucontrol);
--- trivial-2.5.34/include/sound/cs4231.h.orig	2002-09-10 19:10:41.000000000 +1000
+++ trivial-2.5.34/include/sound/cs4231.h	2002-09-10 19:10:41.000000000 +1000
@@ -298,20 +298,20 @@
  */
 
 #define CS4231_SINGLE(xname, xindex, reg, shift, mask, invert) \
-{ iface: SNDRV_CTL_ELEM_IFACE_MIXER, name: xname, index: xindex, \
-  info: snd_cs4231_info_single, \
-  get: snd_cs4231_get_single, put: snd_cs4231_put_single, \
-  private_value: reg | (shift << 8) | (mask << 16) | (invert << 24) }
+{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, .index = xindex, \
+  .info = snd_cs4231_info_single, \
+  .get = snd_cs4231_get_single, .put = snd_cs4231_put_single, \
+  .private_value = reg | (shift << 8) | (mask << 16) | (invert << 24) }
 
 int snd_cs4231_info_single(snd_kcontrol_t *kcontrol, snd_ctl_elem_info_t * uinfo);
 int snd_cs4231_get_single(snd_kcontrol_t * kcontrol, snd_ctl_elem_value_t * ucontrol);
 int snd_cs4231_put_single(snd_kcontrol_t * kcontrol, snd_ctl_elem_value_t * ucontrol);
 
 #define CS4231_DOUBLE(xname, xindex, left_reg, right_reg, shift_left, shift_right, mask, invert) \
-{ iface: SNDRV_CTL_ELEM_IFACE_MIXER, name: xname, index: xindex, \
-  info: snd_cs4231_info_double, \
-  get: snd_cs4231_get_double, put: snd_cs4231_put_double, \
-  private_value: left_reg | (right_reg << 8) | (shift_left << 16) | (shift_right << 19) | (mask << 24) | (invert << 22) }
+{ .iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, .index = xindex, \
+  .info = snd_cs4231_info_double, \
+  .get = snd_cs4231_get_double, .put = snd_cs4231_put_double, \
+  .private_value = left_reg | (right_reg << 8) | (shift_left << 16) | (shift_right << 19) | (mask << 24) | (invert << 22) }
 
 int snd_cs4231_info_double(snd_kcontrol_t *kcontrol, snd_ctl_elem_info_t * uinfo);
 int snd_cs4231_get_double(snd_kcontrol_t * kcontrol, snd_ctl_elem_value_t * ucontrol);
-- 
  Don't blame me: the Monkey is driving
  File: Art Haas <ahaas@neosoft.com>: [PATCH] designated initializer patches for include_sound
