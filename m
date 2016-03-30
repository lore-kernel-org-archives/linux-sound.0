From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 30 Mar 2016 20:31:15 +0000
Subject: Re: [PATCH] ALSA: usb-audio: Fix double-free in snd_usb_add_audio_stream()
Message-Id: <s5hbn5v7lnw.wl-tiwai@suse.de>
List-Id: <linux-sound.vger.kernel.org>
References: <1459364602-28997-1-git-send-email-vdronov@redhat.com>
	<1459364602-28997-2-git-send-email-vdronov@redhat.com>
In-Reply-To: <1459364602-28997-2-git-send-email-vdronov@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladis Dronov <vdronov@redhat.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

On Wed, 30 Mar 2016 21:03:22 +0200,
Vladis Dronov wrote:
> 
> There is a double-free bug in [snd-usb-audio] module due to alloc/free logic
> flaw in snd_usb_add_audio_stream() function. This leads to kernel structures
> corruption and panic. Fix the code flow and alloc/free logic so there is no
> double-free.
> 
> The detailed analysis: https://bugzilla.redhat.com/show_bug.cgi?id83358
> 
> Reported-by: Ralf Spenneberg <ralf@spenneberg.net>
> Signed-off-by: Vladis Dronov <vdronov@redhat.com>

Thanks for the report.  But how about a simpler fix like below?


Takashi

---
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index fb62bce2435c..0e154ae7924e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -150,6 +150,7 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 		usb_audio_err(chip, "cannot memdup\n");
 		return -ENOMEM;
 	}
+	INIT_LIST_HEAD(&fp->list);
 	if (fp->nr_rates > MAX_NR_RATES) {
 		kfree(fp);
 		return -EINVAL;
@@ -193,8 +194,11 @@ static int create_fixed_stream_quirk(struct snd_usb_audio *chip,
 	return 0;
 
  error:
-	kfree(fp);
-	kfree(rate_table);
+	/* linked fp will be removed in snd_usb_audio_pcm_free() */
+	if (list_empty(&fp->list)) {
+		kfree(fp);
+		kfree(rate_table);
+	}
 	return err;
 }
 
