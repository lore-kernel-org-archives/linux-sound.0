From: Chris Rankin <rankinc@pacbell.net>
Date: Wed, 01 Aug 2001 02:06:35 +0000
Subject: [PATCH] : register_sound_special() fails for unit >= 16
Message-Id: <marc-linux-sound-99663181326838@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I have noticed that the register_sound_special() function in
drivers/sound/sound_core.c implicitly assumes that it will never be
asked to allocate a device with a minor number >= 16. This is
unfortunate because some 3rd party kernel modules use
register_sound_special() to create all their device nodes. If (as I
do) you have more than one sound device then you are stuck when you
need /dev/dsp1, /dev/mixer1 etc.

I have written a small patch that solves this; any feedback would be
greatly appreciated. Note that I have also renamed "sequencer2" to
"music" to resolve a name conflict between devices (14,8) and (14,33),
and "midi00" to "midi" to bring this function into line with
register_sound_midi().

Cheers,
Chris

--- drivers/sound/sound_core.c.orig	Tue Jul 31 18:26:12 2001
+++ drivers/sound/sound_core.c	Tue Jul 31 18:41:45 2001
@@ -17,7 +17,7 @@
  *	plug into this. The fact they dont all go via OSS doesn't mean 
  *	they don't have to implement the OSS API. There is a lot of logic
  *	to keeping much of the OSS weight out of the code in a compatibility
- *	module, but its up to the driver to rember to load it...
+ *	module, but its up to the driver to remember to load it...
  *
  *	The code provides a set of functions for registration of devices
  *	by type. This is done rather than providing a single call so that
@@ -173,10 +173,10 @@
 		return r;
 	}
 	
-	if (r = low)
+	if ( r < SOUND_STEP )
 		sprintf (name_buf, "%s", name);
 	else
-		sprintf (name_buf, "%s%d", name, (r - low) / SOUND_STEP);
+		sprintf (name_buf, "%s%d", name, (r / SOUND_STEP));
 	s->de = devfs_register (devfs_handle, name_buf,
 				DEVFS_FL_NONE, SOUND_MAJOR, s->unit_minor,
 				S_IFCHR | mode, fops, NULL);
@@ -231,9 +231,10 @@
  
 int register_sound_special(struct file_operations *fops, int unit)
 {
-	char *name;
+	const int chain = (unit & 0x0F);
+	const char *name;
 
-	switch (unit) {
+	switch (chain) {
 	    case 0:
 		name = "mixer";
 		break;
@@ -241,7 +242,7 @@
 		name = "sequencer";
 		break;
 	    case 2:
-		name = "midi00";
+		name = "midi";
 		break;
 	    case 3:
 		name = "dsp";
@@ -259,7 +260,7 @@
 		name = "unknown7";
 		break;
 	    case 8:
-		name = "sequencer2";
+		name = "music";
 		break;
 	    case 9:
 		name = "dmmidi";
@@ -283,7 +284,7 @@
 		name = "unknown";
 		break;
 	}
-	return sound_insert_unit(&chains[unit&15], fops, -1, unit, unit+1,
+	return sound_insert_unit(&chains[chain], fops, -1, unit, chain+128,
 				 name, S_IRUSR | S_IWUSR);
 }
  
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
