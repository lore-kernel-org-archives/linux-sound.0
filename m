Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACBB335BA
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 00:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776819250; cv=none; b=bIZylbwaAT8LsJbdjqOf/pHxcLRR09mgj4beoRsw8zZjfXDTXeXKvadWncUHG/pknJcErHVHeO+6xLUrwtHgAnxR1LJ8uVPpoItHAr31b5FvZLXMlIEToq9BjMapZP62JdKF6BPhndce2VvualoeAgY27XvKckn7b0yAei+cojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776819250; c=relaxed/simple;
	bh=oULGjG5GZU5uTRY06JYOKrCRx+zd81vIOoy5cKg3Lag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HMJDMGcckCrAprATURQF5t8c7q8uvQlNNKk6exogjHCcnY7h4MgP8qEXsNfk1ztEVf9Q5CsbSKkGxcgEFa4fQM7w0PfQZYmsG8kwtWcVqt8MCH4pBOlcbcBHUQNctaWyWi5PA8OFomXpphpKWJDKGyLZsD6xKWqfwWy8o/J9YvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFuE5Hpy; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFuE5Hpy"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2e221a71e19so4591219eec.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 17:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776819248; x=1777424048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEPznx1qAI8FTDXOwTfZzkvUsU4Rd9xTBemC7UbrqCQ=;
        b=eFuE5HpyF8N2RQI/pOFNebdlVTOmUOMcgPvHoaMY/xA7i+h28oO6N4asnReDN9mBpi
         bwT+wY2PmhhYZ2LfxoAuDGc7XsoLldrBLcxelkgLPj1RRX1vyx/PG0Kh5SFFlIBNEl4G
         e0an/6r5FB3dhhUb5MhacjMu2MsI9RVJ7kUsSDVUDskICYW+XzvsKPOVXRmOspCpoqM/
         Erzg5J0UaS6fS79Zpzr2SXP1vogn5Z/fcBDBpYwa5n9WvP+DSmTZuvKDynSsE8Ifkejk
         L1gETlSAkLYtp+nCyjrxOkI1ta72cHcBSO4JmoG0katjZX9nHGFGqh885kxUuPZPhSqq
         F87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776819248; x=1777424048;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEPznx1qAI8FTDXOwTfZzkvUsU4Rd9xTBemC7UbrqCQ=;
        b=l4OiCSMhlvkGvyHiekVX0qqiuTTbueQIKuiiklh6l3Y2EKhCdM/GnpdtaG5RHYdN9N
         /jBSG+MhaiOsRtHJ4LAo8ljFzEOTp6qfkxF/Wz3izJUua/IcNxrcZ/fIQYJ17OZGLxFh
         bhGpYJu2ylpsO5926PQIURrTArvQOTurJzmPKLx5MkIsFVAtF1CffInWwCbmrg2y5xeB
         kAJaSCWC0gHLiwzJD0rKlXjYolkUmATaI3LkhtsyWpiE29sNmEE1E7g8m4lEtlIIhzsH
         a0NTHKuDIVHhHZKcPHDsSe+3foDKmpdj3eehSXqlFfw6PCFiNkEzFmBqNQz3ECb+1Yoh
         P1uQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OXIXb/7ytorTWQI+hnc0X+zgvqKVlpYYmxfGCzoDbRLygdBf3Zgz0xlOhei1qvDtJVQTmu+eIebp1MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMBWdTOR/mTNalpmwbwRdQuIEvZdoG+Ens/R4HTrhKKW+BBCJ
	j5sSVJK97k4yl9gYO55Lt0fLI4D2qm8oXFNWCSdakJgqfepuXNJ9ttzl
X-Gm-Gg: AeBDies8y97swtD8sH5O5V3aTlXdj1Of5S91bySUgFEnMhBXz13W4X0ykqv9iieiu2z
	Pjki0JfU5VLkG1B8Rp+zEE/Etaf098te0cgx2+d4NVDmquCU2naSXnN4eiCoK8XG5kPcpWJOsU9
	C5/cejgfAjJV/H+Qw6zLEGNunMEE2h5iLFDTKLVG3QFTeEos0+KeBiD8NH3TK50L0bQeoDZfZwv
	7+l59w//qj/eST+gjZzTuqrI52/kgwAyXEb1fE7laFqITI5bmNpHinXUCyZWAKdlstp1hv6iz/u
	uVy3oIDR3oFCvhtVOILepx/pgAjZGt/CAnI104KDz6EWQnml68mfq0CksGPhkL9bfwkEqhPK4ET
	Xv0ew5nyrfriOpglViBOp8+hCvQTAgx9iwp+Kro6Ac2vQM3H1FCxeNLZYx1OS2XPFC23hcj7SyE
	uCVyPbtiyk9zgrkWjdj/FeBYrbaeIhpJfHO2ObgJspaY45oE5d3Sx6LNxnYRFdymoycrCAOwG3S
	kHR8NKSt8RW
X-Received: by 2002:a05:7300:4349:b0:2be:7fc2:fc38 with SMTP id 5a478bee46e88-2e466044e0fmr10934403eec.5.1776819247623;
        Tue, 21 Apr 2026 17:54:07 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa6134sm21804460eec.3.2026.04.21.17.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 17:54:07 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 21 Apr 2026 21:53:52 -0300
Subject: [PATCH] ALSA: usb-audio: Avoid false E-MU sample-rate
 notifications
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-alsa-emuusb-samplerate-notify-v1-1-8b63bbc1d7f1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQ7CMAwAwK9UPmOpCy3LVxAHJ3HAqE2rOEGgq
 n8nwHEus4JyFFY4VytEforKHAqaXQX2TuHGKK4Y2rod6n1zQBqVkKec1aDStIwcKTGGOYl/48m
 7Y+d62w2mh3Iskb28fv/l+rdm82Cbvils2wcG4KA8gQAAAA==
X-Change-ID: 20260417-alsa-emuusb-samplerate-notify-9fd83d5c36b5
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Sergiy Kovalchuk <cnb_zerg@yahoo.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=oULGjG5GZU5uTRY06JYOKrCRx+zd81vIOoy5cKg3Lag=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkvZLTPpJsJNteUrMy4sbpI9eXnatXPpQGnSnWKddLma
 F0yvJnYUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABMxXsTIMPvRVbbgol1dVSfP
 JRx2v7TCLXjxtm2eB1LNuf22+5+55MfwP+KwVUBq7vtmRq7Fzzv+n4uZf/v31X7nY2s8Ih9ycfa
 FMQIA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_emuusb_set_samplerate() unconditionally notifies the E-MU
SampleRate Extension Unit control after issuing SET_CUR.

If snd_usb_mixer_set_ctl_value() fails, the control value has not
changed, yet snd_usb_mixer_notify_id() still invalidates the cache and
emits a value-change event to userspace.

Notify the control only after a successful write.

Fixes: 7d2b451e65d2 ("ALSA: usb-audio - Added functionality for E-mu 0404USB/0202USB/TrackerPre")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_quirks.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a01510a855c2..5194a2ac1ea8 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -1538,15 +1538,17 @@ void snd_emuusb_set_samplerate(struct snd_usb_audio *chip,
 {
 	struct usb_mixer_interface *mixer;
 	struct usb_mixer_elem_info *cval;
+	int err;
 	int unitid = 12; /* SampleRate ExtensionUnit ID */
 
 	list_for_each_entry(mixer, &chip->mixer_list, list) {
 		if (mixer->id_elems[unitid]) {
 			cval = mixer_elem_list_to_info(mixer->id_elems[unitid]);
-			snd_usb_mixer_set_ctl_value(cval, UAC_SET_CUR,
-						    cval->control << 8,
-						    samplerate_id);
-			snd_usb_mixer_notify_id(mixer, unitid);
+			err = snd_usb_mixer_set_ctl_value(cval, UAC_SET_CUR,
+							  cval->control << 8,
+							  samplerate_id);
+			if (!err)
+				snd_usb_mixer_notify_id(mixer, unitid);
 			break;
 		}
 	}

---
base-commit: d60c26089541d574b854d7762e9f3c182a76ad9d
change-id: 20260417-alsa-emuusb-samplerate-notify-9fd83d5c36b5

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

