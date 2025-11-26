Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97553126C02
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 00:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117638; cv=none; b=asvCYBDEt+pJ4e7MvEHSEJUr3z3O87TkH2ywj09/RfQxYB9B4PNOFU9urLn1UP7vMJzXj/1L3K5BJeqIq6bK/LHwCnGUutshyum1o4IOU54QZB4CRO8/DGDqIU7rKLBB0c3m4NDpdEyqA+pNYcrG9RPDD1h/aoO4leXxeTej7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117638; c=relaxed/simple;
	bh=nmVqk0FYvT3z/HoX3hXyTA0zoCnTuSLyiM8lNB/Cd9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqqmyw+UBZcjxhbq1pzFmXDX9jlS76ayy2fc7SBw8vRVGMlyk0crwtjvpDanK84cjami7EPyOn3kSVvqDjSIIBvjLn03UKT87iFsEB/i2p68IZrR0oox9xSkJYD3Qn8TkR3pkGJF6Grhyz5/4H6zl/ExepxMaOynDfKLd5yU+1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=PvGTYnvM; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="PvGTYnvM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B/uthwvWFmLkZJ97EnJpWwfHZ+bhJ4w2hE9TgTu3jsk=; b=PvGTYnvMHThuM4nzSqZW22at4J
	WTbhUMjlBuvGVmX6O6I5lLw8HiJ9QPt920u/Mrt60v/pCYSg+ojGJgmChRT8CmbJLPY3FoXxR7qIF
	pFe8RBlrngfeRyDVVMIFkuEgisX6eIkjGQtIirLj9U9rwegEf9jjPr1ZK4ucNlHRzvgRLGdeCIbek
	J+sTIeoh2rlJHRQsr29oFLwlrBxCgL7V1NxetCDK5ppC/c4hsa2o1KMhNbLyMRiT8gvU9zGC/5C2K
	t/HM8xxx57Hb0KAxjOyNRoFfPBRdMnBrJXNo4XU6q6MZTlvtn8H7eJAmm/4+x4XcP3dcPBa+DHdN0
	N+7dZE/1veBdo7V47wegjzx9OsFUL3FuaRCetMiU+iB4N29rm4sIpaZbqz+Pe2+oh5h8dr6D4UJ+H
	/HcLZFvx0+Coob8ty4xVj/C/FWAIqYkNRPtufJbI2+B6UvfqFtjdc9/2CCFOsGqqffB7MKbfvbV9o
	s1i4JVqwCjTwGDRz1E62xG41/TSXIOSJrw8V2TkbXI8HoH9+BDt7SQeOtCgyfM/JJCR672wSfs5SA
	yWl688dAl1nNhV+vty8AZq7X+8IRLKjk/wkzZsptM+P8chUEuzLkIH448Dv0GZP2TvWkOkI3b+sjl
	dBf+MNt26sV7dq2p+IMm4ikaQcjdYj/WjLbjTJ4ek=;
Received: from [2a02:587:6a0c:9900:f7ed:bcf0:918c:fb30] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1vO3YS-00000002Tpc-0rkA;
	Wed, 26 Nov 2025 02:38:44 +0200
From: Tasos Sahanidis <tasos@tasossah.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH 2/2] ALSA: usb-audio: Implement jack detection for HP Thunderbolt Dock G2
Date: Wed, 26 Nov 2025 02:29:57 +0200
Message-ID: <20251126003805.2705503-3-tasos@tasossah.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126003805.2705503-1-tasos@tasossah.com>
References: <20251126003805.2705503-1-tasos@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Thunderbolt Dock G2 includes a headset jack with support for
jack detection. However, this being a UAC1 device, detection is
implemented via vendor-defined URB Controls.

Implement it in a similar way to the Dell WD15/19 docks, but with
different commands.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/usb/mixer_quirks.c | 102 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a48eb3b8cab2..fe6c2cebc7f0 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2363,6 +2363,105 @@ static int dell_dock_mixer_init(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*
+ * HP Thunderbolt Dock G2 jack detection
+ *
+ * Similar to the Dell WD15/WD19, but with different commands.
+ */
+
+#define HP_DOCK_JACK_INTERRUPT_NODE	7
+
+#define HP_DOCK_GET			37
+
+#define HP_DOCK_JACK_PRESENCE		0xffb8
+#define HP_DOCK_JACK_PRESENCE_BIT	BIT(2)
+
+#define HP_DOCK_MIC_SENSE		0xf753
+#define HP_DOCK_MIC_SENSE_COMPLETE_BIT	BIT(4)
+
+#define HP_DOCK_MIC_SENSE_MASK		(BIT(2) | BIT(1) | BIT(0))
+/* #define HP_DOCK_MIC_SENSE_PRESENT	0x2 */
+#define HP_DOCK_MIC_SENSE_NOT_PRESENT	0x4
+
+static int hp_dock_ctl_connector_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct usb_mixer_elem_info *cval = snd_kcontrol_chip(kcontrol);
+	struct snd_usb_audio *chip = cval->head.mixer->chip;
+	u32 pv = kcontrol->private_value;
+	bool presence;
+	int err;
+	u8 buf;
+
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	err = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+		       HP_DOCK_GET,
+		       USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_IN,
+		       0, HP_DOCK_JACK_PRESENCE, &buf, sizeof(buf));
+	if (err < 0)
+		return err;
+
+	presence = !(buf & HP_DOCK_JACK_PRESENCE_BIT);
+
+	if (pv && presence) {
+		for (int i = 0; i < 20; i++) {
+			err = snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
+			       HP_DOCK_GET,
+			       USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_IN,
+			       0, HP_DOCK_MIC_SENSE, &buf, sizeof(buf));
+			if (err < 0)
+				return err;
+
+			/* Mic sense is complete, we have a result. */
+			if (buf & HP_DOCK_MIC_SENSE_COMPLETE_BIT)
+				break;
+
+			msleep(100);
+		}
+
+		/*
+		 * If we reach the retry limit without mic sense having
+		 * completed, buf will contain HP_DOCK_MIC_SENSE_PRESENT,
+		 * thus presence remains true even when detection fails.
+		 */
+		if ((buf & HP_DOCK_MIC_SENSE_MASK) == HP_DOCK_MIC_SENSE_NOT_PRESENT)
+			presence = false;
+	}
+	ucontrol->value.integer.value[0] = presence;
+	return 0;
+}
+
+static const struct snd_kcontrol_new hp_dock_connector_ctl_ro = {
+	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+	.name = "", /* will be filled later manually */
+	.access = SNDRV_CTL_ELEM_ACCESS_READ,
+	.info = snd_ctl_boolean_mono_info,
+	.get = hp_dock_ctl_connector_get,
+};
+
+static int hp_dock_mixer_create(struct usb_mixer_interface *mixer)
+{
+	int err;
+
+	err = realtek_add_jack(mixer, "Headsets Playback Jack", 0,
+			       HP_DOCK_JACK_INTERRUPT_NODE,
+			       &hp_dock_connector_ctl_ro);
+	if (err < 0)
+		return err;
+
+	err = realtek_add_jack(mixer, "Headset Capture Jack", 1,
+			       HP_DOCK_JACK_INTERRUPT_NODE,
+			       &hp_dock_connector_ctl_ro);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+
 /* RME Class Compliant device quirks */
 
 #define SND_RME_GET_STATUS1			23
@@ -4414,6 +4513,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x2b73, 0x0034): /* Pioneer DJ DJM-V10 */
 		err = snd_djm_controls_create(mixer, SND_DJM_V10_IDX);
 		break;
+	case USB_ID(0x03f0, 0x0269): /* HP TB Dock G2 */
+		err = hp_dock_mixer_create(mixer);
+		break;
 	}
 
 	return err;
-- 
2.43.0

