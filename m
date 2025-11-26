Received: from devloop.tasossah.com (devloop.tasossah.com [145.239.141.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F90B126C02
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 00:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.141.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117646; cv=none; b=GXOb2vmi9Xv8SnFzg9ASOYWCLOIPjIT1LMdKDNfeuuEhJ/1Mlv/34Q1+OPCAKpqnbCX3qwuKCERx7u7Rnai4BOQHqN2IAQ2bW4/AENucXtLUWOTQknXMTZLtNcygMjnLDiF3y7GlEBOXOdHfhIT/yFq+4BYSRg12pVtli8qcOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117646; c=relaxed/simple;
	bh=f7dK+yVYOKugGL6UPQrbMzViOdAUKVD4qKZn5WAU0wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfyVDMglZVrUw9fBM71I7RvJ+yTuivJbZtqIlhYYRk+lk1CRmIDZtQCT8AnahrUD/jvvx1Id/p5Qj38CNdzuJJQOLCrnUeNogc0WEtg8z/ixWelnNXXT3HYv9ZjQocknn4JVZcDZ7K9rehtEWeops6p0RXSN70vvumenhtaaq2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b=irJuWW+e; arc=none smtp.client-ip=145.239.141.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=tasossah.com header.i=@tasossah.com header.b="irJuWW+e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=tasossah.com; s=devloop; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BFh2/TwtWGfdJX1jXAxculgWJtFztdtuwSi8MsdULkI=; b=irJuWW+eom6RZ+vRUbfg/XAKFG
	UxlrbjxMPeHxZHh0og82bs0p+JCW0jEdTHxcu6+cmnTXdPbwi0yEMvjQEVtaNvX7D775JhIYTW7xI
	1dn9PWZG8dYLhTVZ/vcV9nLJaI7J2YKO0W5EQeK1SFjG7nHSZhMoahCSK6KjpXiGFNlhy9+HZZQVg
	xGJ4muBgltIMJSRy7WoM3zjmj9dIxfgIfximetWo3emGZv/ZpjzlKhKxUy18Uzo0ZFehjh27BeqER
	rj5OZ2siTIfaX9Kb/Tmm4OUNwXYWZ87JutEf4F3HLxe/vVjFIzlH9QDPFIz+zTVdB2foTgUqw2u18
	1rX004wbSest8ij+U8JonnR+gBu18CRhodNJlQ7Z1NsxtvXpA982s5tl8rkCAGlTmglQYGf3ZeHdr
	IG7xlTYSD6OrQ5MrsPqu0LaoyH7eH29yntw4yv6IFr9IMrQDohQefPYLyHjm1A8tatmLvXqgTVGPT
	5vBHoQIBjoTlEXwfnFe9swX3l1D/TvzHVaSJO9dVvtT1/n+4io/+yrdGh+J1s7p3lf6GHYKepbYMI
	YwdHZ+iZYuklMPuGhXN803I+7+WC8CK8koF4A+rbkD5pA1fPr2jM3mcaCxlUI/XyXaDgwTHBxa8NC
	yrbdKfGxTE3xFNmmX+dL8t/uctHxWf6q7mMCuLEUU=;
Received: from [2a02:587:6a0c:9900:f7ed:bcf0:918c:fb30] (helo=localhost.localdomain)
	by devloop.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97)
	(envelope-from <tasos@tasossah.com>)
	id 1vO3YR-00000002Tpc-2Cel;
	Wed, 26 Nov 2025 02:38:43 +0200
From: Tasos Sahanidis <tasos@tasossah.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	=?UTF-8?q?Jan=20Sch=C3=A4r?= <jan@jschaer.ch>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH 1/2] ALSA: usb-audio: Modularize realtek_add_jack in mixer_quirks
Date: Wed, 26 Nov 2025 02:29:56 +0200
Message-ID: <20251126003805.2705503-2-tasos@tasossah.com>
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

Modify the realtek_add_jack function used for the jack detection quirk
to allow passing the mixer unit id and an snd_kcontrol_new.

This allows adding additional devices that require the same quirk, but
implement jack detection with different commands.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/usb/mixer_quirks.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 828af3095b86..a48eb3b8cab2 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2277,7 +2277,8 @@ static int realtek_resume_jack(struct usb_mixer_elem_list *list)
 }
 
 static int realtek_add_jack(struct usb_mixer_interface *mixer,
-			    char *name, u32 val)
+			    char *name, u32 val, int unitid,
+			    const struct snd_kcontrol_new *kctl_new)
 {
 	struct usb_mixer_elem_info *cval;
 	struct snd_kcontrol *kctl;
@@ -2285,14 +2286,13 @@ static int realtek_add_jack(struct usb_mixer_interface *mixer,
 	cval = kzalloc(sizeof(*cval), GFP_KERNEL);
 	if (!cval)
 		return -ENOMEM;
-	snd_usb_mixer_elem_init_std(&cval->head, mixer,
-				    REALTEK_JACK_INTERRUPT_NODE);
+	snd_usb_mixer_elem_init_std(&cval->head, mixer, unitid);
 	cval->head.resume = realtek_resume_jack;
 	cval->val_type = USB_MIXER_BOOLEAN;
 	cval->channels = 1;
 	cval->min = 0;
 	cval->max = 1;
-	kctl = snd_ctl_new1(&realtek_connector_ctl_ro, cval);
+	kctl = snd_ctl_new1(kctl_new, cval);
 	if (!kctl) {
 		kfree(cval);
 		return -ENOMEM;
@@ -2322,14 +2322,20 @@ static int dell_dock_mixer_create(struct usb_mixer_interface *mixer)
 			USB_RECIP_DEVICE | USB_TYPE_VENDOR | USB_DIR_OUT,
 			0, 0, NULL, 0);
 
-	err = realtek_add_jack(mixer, "Line Out Jack", REALTEK_LINE1);
+	err = realtek_add_jack(mixer, "Line Out Jack", REALTEK_LINE1,
+			       REALTEK_JACK_INTERRUPT_NODE,
+			       &realtek_connector_ctl_ro);
 	if (err < 0)
 		return err;
-	err = realtek_add_jack(mixer, "Headphone Jack", REALTEK_HP_OUT);
+	err = realtek_add_jack(mixer, "Headphone Jack", REALTEK_HP_OUT,
+			       REALTEK_JACK_INTERRUPT_NODE,
+			       &realtek_connector_ctl_ro);
 	if (err < 0)
 		return err;
 	err = realtek_add_jack(mixer, "Headset Mic Jack",
-			       REALTEK_HP_OUT | REALTEK_MIC_FLAG);
+			       REALTEK_HP_OUT | REALTEK_MIC_FLAG,
+			       REALTEK_JACK_INTERRUPT_NODE,
+			       &realtek_connector_ctl_ro);
 	if (err < 0)
 		return err;
 	return 0;
-- 
2.43.0

