Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED32701B6
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 21:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535127; cv=pass; b=LsppPcBPMMiQ4Cx67E+uEUxB2doWNpkzzp4n6rPar0WItlvv/3ESPKjUo2GyVGeADDZfsU2cZT+MzLQrxkQ7+fMvY0IDFIbWwFgynvFUNj0DrYm2R4p2wDHOKiwKxqMsbc1JdM95lzGWyDHho6BTMoapQgMNKCU7leF6+5LXotI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535127; c=relaxed/simple;
	bh=+4XU+4vbgbs4z1rWJ942uCcsb/xJBS52FXcbV22pp9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K5zlzoQkrf75p9J+OTIIFo0qyqKz6GB3paj+5WO3Ingfr4hbCQYrqnKPSvNFeYf7CJ2rvj3Pulb3/khg6ntTXv0d/jwxq+0cdbBuCpV9zQ1nKeA1H2S5eOK10gDf1tayfrdAXK33IuwV307sE7pQV2xMsqqsmT8XfL4Oiag1o4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mungewell.org; spf=pass smtp.mailfrom=mungewell.org; dkim=pass (2048-bit key) header.d=mungewell.org header.i=@mungewell.org header.b=oZA+xF+M; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mungewell.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mungewell.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mungewell.org header.i=@mungewell.org header.b="oZA+xF+M"
X-Sender-Id: idigitalinternetinc|x-authuser|simon@mungewell.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 368786421AD
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 21:25:17 +0000 (UTC)
Received: from barmail5.idig.net (trex-green-4.trex.outbound.svc.cluster.local [100.98.10.134])
	(Authenticated sender: idigitalinternetinc)
	by relay.mailchannels.net (Postfix) with ESMTPA id E335A6427F3
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 21:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1778534716;
	b=uOHWRQBC7mysAoHC4xnYYJHq0phrobmAImiWhO7hG/KAoA6D6tNe+JOlez7NtwWR/DOrZ9
	/EjTvGrVuCQvez+yyckZkggCqs43+RsMmvNeqgcQJ6OUnH3249ksMIrNiYs4bjnO/m68p0
	veoqAgmSRnWacbnzE6Y3OLXxZ7hZtVvAEZQA+SQY3dfn7S09IX/KnOIHdzNvalBVlAedm8
	0twqzy7BLn7Z/NcdAtLsEy15I/j/P95R8r0O0xj97XlUbhwljFmvfIOMRronVluvqLpWax
	OSoRhlA3lgl+5m4mXWH/xXV7YYWID59Fe00q54JmicbeYm/EDKhWK+K8KOCRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1778534716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=gO/l+PrpBQIE81oCGZS84ryjmN5q7PHpeH4KZzgS+sk=;
	b=accujj1CLoJOllbFtTzQeEfoxDlmlXrKACuXE3BUtzBFw69lTac4xRSunAiHZCUqmJVgIU
	nLXIClFLDqv8pOi0KOG7ZK5TvmbwQQ6k9IBnCWt0Bq7Dn/qG3xPPCTIsVRI99/HgbNiTUq
	Bc1TmhyPuMOtuo8L7R7toraB/Oo7WaVXgkZS5n4lpMk96WaXEFZsu1NX9TpRU0QW1Q30Aj
	AW56bfqCwstJn2oADbP989lIpi5Yw6hicUKigRJ5bwhEXiQoB0yydisUm2FQE7Je6ZJCwQ
	mBDPFy1A+oeS3ioFGMLonNW3aMoAfYu7kloLY07Is84q4rafh8mnCemikwUPjQ==
ARC-Authentication-Results: i=1;
	rspamd-5c5444c55f-zq984;
	auth=pass smtp.auth=idigitalinternetinc smtp.mailfrom=simon@mungewell.org
X-Sender-Id: idigitalinternetinc|x-authuser|simon@mungewell.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: idigitalinternetinc|x-authuser|simon@mungewell.org
X-MailChannels-Auth-Id: idigitalinternetinc
X-Robust-Decisive: 3f08896700317f1a_1778534717128_390626708
X-MC-Loop-Signature: 1778534717128:3720174235
X-MC-Ingress-Time: 1778534717128
Received: from barmail5.idig.net (barmail5.idig.net [104.36.151.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.10.134 (trex/7.1.5);
	Mon, 11 May 2026 21:25:17 +0000
Received: from cwh28.canadianwebhosting.com (cwh28.canadianwebhosting.com [66.85.29.119]) by barmail5.idig.net with ESMTP id rb5PYwDNo7QxBGqT (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO); Mon, 11 May 2026 14:25:15 -0700 (PDT)
X-Barracuda-Envelope-From: simon@mungewell.org
X-Barracuda-Effective-Source-IP: cwh28.canadianwebhosting.com[66.85.29.119]
X-Barracuda-Apparent-Source-IP: 66.85.29.119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mungewell.org; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gO/l+PrpBQIE81oCGZS84ryjmN5q7PHpeH4KZzgS+sk=; b=oZA+xF+M7UVf5OYZGF6JE/uZT8
	ez/JNzOZBx00/oiYkoPf4igsODVmKUs+r8Otu3/JIekx3x6PRscpb26JtAyABgRtPjHU0mVrtaRGK
	t7W1FprQI501PAjIatRMr59b5zszwS8z23T0IUUhl5Zv6H693EhDz3aukTju527N5tSeYlQHul1Hy
	g/yFDF/2RA1eSaQ4D11idVJpNNMrp5TrZ/byDvQ3Tt+iXhqwyZXflfc9f6gOsJQyefIQA+fIN7NeC
	VqWSVwsI/znkaC1rpFOY4u4zD4PxO3zAp+dzDgcE494Ca144aILMJicEqWIOAMwTUiMpqImwt2TnF
	MzbFhhWQ==;
Received: from [129.222.141.190] (port=59574 helo=localhost.localdomain)
	by cwh28.canadianwebhosting.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <simon@mungewell.org>)
	id 1wMY7n-0000000EsHX-10ZB;
	Mon, 11 May 2026 17:25:14 -0400
From: Simon Wood <simon@mungewell.org>
To: perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Simon Wood <simon@mungewell.org>
Subject: [PATCH] ALSA: M-Audio C600 disable Output Gain Knob
Date: Mon, 11 May 2026 15:24:58 -0600
X-ASG-Orig-Subj: [PATCH] ALSA: M-Audio C600 disable Output Gain Knob
Message-ID: <20260511212458.44142-1-simon@mungewell.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: simon@mungewell.org
X-Barracuda-Connect: cwh28.canadianwebhosting.com[66.85.29.119]
X-Barracuda-Start-Time: 1778534715
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://104.36.151.219:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at idig.net
X-Barracuda-Scan-Msg-Size: 3400
X-Barracuda-BRTS-Status: 0
X-ASG-Debug-ID: 1778534715-13d5ac29ecd05b0001-ZTMdje
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=3.5 QUARANTINE_LEVEL=8.0 KILL_LEVEL=4.0 test= 
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.125474
	Rule breakdown below
	  pts rule name              description
	 ---- ---------------------- --------------------------------------------------
	

The C400/C600 interfaces have a large output gain knob which attenuates
the outputs as stereo pairs (1/2, 3/4 and 5/6). The Windows driver/app
provides a control to disable this knob/behaviour on any/all outputs,
forcing maximum gain on each.

The 'disable behaviour' is desirable if any outputs are being used for
aux/effects sends, or if interface is being used as a live/matrix mixer.

This patch adds a control to select which output pairs are affected by
the Output Gain Knob. Default behaviour is to select all outputs.

Tested on the C600, likely also works for the C400.

Signed-off-by: Simon Wood <simon@mungewell.org>
---
 sound/usb/mixer_quirks.c | 46 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 11e205da7964..16d8eb111d01 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -1282,7 +1282,7 @@ static int snd_ftu_eff_switch_init(struct usb_mixer_interface *mixer,
 
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC_GET_CUR,
 			      USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
-			      pval & 0xff00,
+			      (pval & 0xff00) | ((pval & 0xff0000) >> 16),
 			      snd_usb_ctrl_intf(mixer->hostif) | ((pval & 0xff) << 8),
 			      value, 2);
 	if (err < 0)
@@ -1315,7 +1315,7 @@ static int snd_ftu_eff_switch_update(struct usb_mixer_elem_list *list)
 			       usb_sndctrlpipe(chip->dev, 0),
 			       UAC_SET_CUR,
 			       USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
-			       pval & 0xff00,
+			       (pval & 0xff00) | ((pval & 0xff0000) >> 16),
 			       snd_usb_ctrl_intf(list->mixer->hostif) | ((pval & 0xff) << 8),
 			       value, 2);
 }
@@ -1728,6 +1728,44 @@ static int snd_c400_create_effect_ret_vol_ctls(struct usb_mixer_interface *mixer
 	return 0;
 }
 
+/* output gain knob selectively adjusts outputs as stereo pairs */
+/* reuses functions from FTU effect switch */
+static int snd_c400_knob_switch_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const texts[8] = {
+		"None", "1/2", "3/4", "1/2 3/4",
+		"5/6", "1/2 5/6", "3/4 5/6", "1/2 3/4 5/6"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
+}
+
+static int snd_c400_create_knob_switch(struct usb_mixer_interface *mixer,
+	int validx, int bUnitID)
+{
+	static struct snd_kcontrol_new template = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Output Gain Knob",
+		.index = 0,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = snd_c400_knob_switch_info,
+		.get = snd_ftu_eff_switch_get,
+		.put = snd_ftu_eff_switch_put
+	};
+	struct usb_mixer_elem_list *list;
+	int err;
+
+	err = add_single_ctl_with_resume(mixer, bUnitID,
+					 snd_ftu_eff_switch_update,
+					 &template, &list);
+	if (err < 0)
+		return err;
+	list->kctl->private_value = (validx << 8) | bUnitID;
+	snd_ftu_eff_switch_init(mixer, list->kctl);
+	return 0;
+}
+
 static int snd_c400_create_mixer(struct usb_mixer_interface *mixer)
 {
 	int err;
@@ -1760,6 +1798,10 @@ static int snd_c400_create_mixer(struct usb_mixer_interface *mixer)
 	if (err < 0)
 		return err;
 
+	err = snd_c400_create_knob_switch(mixer, 0x0900, 0x20);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
-- 
2.43.0

