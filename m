Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982747;
	b=sTs2a/LX3Pz9HewSjw+WWRZj57L7IQY8ZSwj+DYKX0d91HprN1KpxBw8+bz0pFpND9NG
	 B4lAcmD6dyUTDFTfdbEPZXUeEgRhROQMBFaUYNHk4n9M/7n5z21lJjFE+ZvbHiOJzD3iA
	 qndtSJZ0PbSLrXMuXzBanNT6PeZb/HFAIbRXOP3t97x/1mK8yeh7VSbJZzTuD05W8diu+
	 DFntEvTcYDRndKGal1eRwPMGPykovGfsYS6C900MWuECXtoO39rkJkEJd4wONQQOrMHPI
	 5e2sbYpbppdS2NA2zDBCTytDWDTGD6P3YzQCm70UsVQBXu+5Z8+e72Qt9wJNTPj0IYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWFJz4Q8qG2Ws8Hqzbngo5MJbP2uCsetJ4sQG1p1VLc=;
	b=W+yzJKOoaGbG1AmCxsz1TBDh/bnGb3SwOBhgMJ13qSI4/yn0YiJjUcJWgo+haAjBeODl
	 f5hYA/XtExZa15S6wldyfAwW4991tDkLwJIRu+f2WGM7Nm/n8WPbTZ5b8IQOZOxjxYBrn
	 4mpFhSJezF+FbJe+VLI/QxBUG86C3riD8uBVrNrE27oM7IEjOOpTZN2yu4oUww7eIMRk0
	 dk1O080n9KfLq9VGeVj/zS4sBwN3yCFt/B+WkQZ6uOUvYVq4qGkbRJZYYZh2zM3O6xOHb
	 fKfWqReYhZ90MORM5oNfWK1tcMX66F3JHxMZPdyobBwH//C1z3ZaKz4VqrgPLyGtGYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh9669dd;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA32606A331
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA32606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lh9669dd
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1017466a34.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982746; x=1794587546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWFJz4Q8qG2Ws8Hqzbngo5MJbP2uCsetJ4sQG1p1VLc=;
        b=Lh9669ddVbNQ1uvfRlAKudMMS/D6pZJyImP5ALZfde2MZ7l5VVl9ZHAcE/dlLN+QBU
         kDKXwPrS0/Zm8pwlbofo18KovbucASAuSZPe8h82wEilP9MlspWxRyWsCZYl34jJlubM
         yMOq4WpKHrzjTssKPHTXtcKSJLReL6bRwYLJXRoL1CEC2QybZETKVTkFau1WfMS/9WDj
         T0w9on9KItSHFfZkxoMSnxxd7Opwcjl3rE1cYxtiSXBQwH1io2Q1INKNHY4jg7hMHZnS
         h6a98jbAswD3vxWb4GvR5n5r1VwKhreUSpgFotR/4zs+DzIu6O0GSvIjtPy75g6/rnTQ
         IBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982746; x=1794587546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWFJz4Q8qG2Ws8Hqzbngo5MJbP2uCsetJ4sQG1p1VLc=;
        b=eK54rUjv1zfdfIj55Gf00rb1B/pK368P1O3MJytDh0IO0CcjaKHY7PE2fsPjfrvInn
         G4O4YElfJ8/W1W5c0jXxChRjaDUUhH8x+b0q+c+DG1taSS0ioz8atdImNuur90thmJlM
         Ib4SOb8sJjCopkZ+ZOJ4nlO4yRYROaswmySpOslMxHpMkDuu8XLGJU3SMRyMzuv9LcTi
         I5n86EfMJTIZ2dZwrLEW1FoLwO4C3nV2waPq5T4dQKRbFPtRAL6k/svJiwWJZwusqfr9
         chcfD3M2AxwRB1P2vbX7/01zzGV091ChcqUiRQEXpbG4IP05F5Etux0CL1gX7zcGe7oy
         4Y7A==
X-Forwarded-Encrypted: i=1; AKwUvBwaSfqf1uCa9Ro0DtjEq2srH6s5np2ZVZpt+fylIRQ8b1cTlqdc2mp1x28sOxlrfMCoWa2p9IxkYThx6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8r2kgWwHh5Hi6j1X59POZOYJlOZWIE9vTJfCkHZNbgZoIqsA0/
	OeUFPsafhpb9CBG7UAb5xbq5FeWHw1+x166Vs45RMPMC6la8d1/fFiLa
X-Gm-Gg: AYBFou0T55ofVNaVnBpZDOfrNbqdbvWFlod38rsTRf8nFXxukF0MnN/awwD0zRfayrf
	ajsCPv2ATKUaYE+dMoYibKdTF63CvYO7jeZG7BZPJFAa8mCilT77awhLqAHv7pylPE8JK04urJe
	YEnaSt0aNKyBVfFE1GEXz+1+be6QyUMDb3Vp1zCq8y/aHODkSxdNu6jQVWX/RknfYGiBQxHphcr
	Rocm5lRmmXXyXlMhcaBA2uS+IJH/bC7tqrcAa4IglwDRugyvlT5R97cpNnmT7hJ2on5rMtCFm0E
	eTPS5HDRCyawdzkQFvVYAMsNsEtfYHHlOnrqdwtPsHW0Vdo/Ssmo+DlbYtKYt+q704ujGxmlm6R
	D4OFx+gOJSPVAopMLY+NX7OFJLGWhyquRRX6qHgbcp8P0b0RS8cCzPfsk/rdQOunLUJ6gxVgSvi
	2DmFy03FVcBFCir3Rl92/cda9be+cP/aFuw0Aj85kY+4NoiY63ygKE40nb2meAR94JADoz/AlOY
	qY8sV6KalenxuNiImyogi3Z/Sc3zTu4eTHmgIjm66PNVFnw8Jru9VBZeu4ZeEkNm52Tij7NEeQ9
	qLd/tHt5BnqWwQZ9Np9YHfvYqn2C5A2qCFLNikfwo+qM1DD2eOC+AKNYIVOiyf+hONc=
X-Received: by 2002:a05:6830:264c:b0:7f4:d1aa:2f32 with SMTP id 46e09a7af769-85f1cfd639dmr3322518a34.11.1793982746449;
        Fri, 06 Nov 2026 08:32:26 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:25 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 02/16] ALSA: mixer_audient: explicitly define full control names
Date: Fri,  6 Nov 2026 10:31:15 -0600
Message-ID: <20261106163129.1006907-3-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christian Ruppert <arc@gmx.li>

Previously, control names were dynamically created depending if the
control was an input or an output, a volume or a switch. Get rid of this
logic by simply defining the full name in the control structure.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 50 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e2700b08cf80..2afef52a12d9 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -90,107 +90,92 @@ static const struct snd_audient_ctrl_type {
 	},
 };
 
-#define SND_AUDIENT_FLAGS_DIRECTION (1L<<0)
-#define SND_AUDIENT_FLAGS_CAPTURE (1L<<0)
-#define SND_AUDIENT_FLAGS_PLAYBACK (0L<<0)
 
 struct snd_audient_ctrl {
-	char *basename;
+	char *name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
 	unsigned int val_offs;
-	unsigned long flags;
 };
 
 static const struct snd_audient_ctrl snd_audient_evo4_controls[] = {
 	{
-		.basename = "Master",
+		.name = "Master Playback Switch",
 		.type = SND_AUDIENT_TYPE_MUTE_OUT,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename = "Mic",
+		.name = "Mic Playback Switch",
 		.type = SND_AUDIENT_TYPE_MUTE,
 		.channels = 4,
 		.hwchannels = 2,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename = "Monitor",
+		.name = "Monitor Playback Volume",
 		.type = SND_AUDIENT_TYPE_MONITOR,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename = "Mic 1",
+		.name = "Mic 1 Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Mic 2",
+		.name = "Mic 2 Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 2,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Master Left",
+		.name = "Master Left Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 4,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Master Right",
+		.name = "Master Right Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 6,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Loopback Left",
+		.name = "Loopback Left Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 8,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Loopback Right",
+		.name = "Loopback Right Capture Volume",
 		.type = SND_AUDIENT_TYPE_MIXER,
 		.channels = 2,
 		.hwchannels = 2,
 		.val_offs = 10,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Mic 1 Phantom",
+		.name = "Mic 1 Phantom Capture Switch",
 		.type = SND_AUDIENT_TYPE_PHANTOM,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 0,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename = "Mic 2 Phantom",
+		.name = "Mic 2 Phantom Capture Switch",
 		.type = SND_AUDIENT_TYPE_PHANTOM,
 		.channels = 1,
 		.hwchannels = 1,
 		.val_offs = 1,
-		.flags = SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{ 0 }, /* sentinel */
 };
@@ -458,13 +443,12 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 {
 	const struct snd_audient_ctrl_type *ctype
 					= &snd_audient_ctypes[ctrl->type];
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new knew = { 0 };
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
 
 	knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	knew.name = name;
+	knew.name = ctrl->name;
 	knew.info = snd_ctl_audient_info;
 	knew.private_value = snd_audient_kctl_priv(ctrl->type, ctrl->val_offs,
 						   ctrl->hwchannels);
@@ -486,12 +470,6 @@ static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
 		return -EINVAL;
 	}
 
-	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
-		 ((ctrl->flags & SND_AUDIENT_FLAGS_DIRECTION)
-			== SND_AUDIENT_FLAGS_CAPTURE) ? "Capture" : "Playback",
-		 (ctype->type == SNDRV_CTL_ELEM_TYPE_BOOLEAN)
-			? "Switch" : "Volume");
-
 	elem = kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
@@ -524,7 +502,7 @@ int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 	if (!info->controls)
 		return -ENODEV;
 
-	for (ctrl = info->controls; ctrl->basename; ctrl++) {
+	for (ctrl = info->controls; ctrl->name; ctrl++) {
 		const int ret = snd_audient_add_ctrl(mixer, ctrl);
 
 		if (ret < 0)
-- 
2.47.3

