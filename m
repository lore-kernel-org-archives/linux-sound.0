Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B63D34A4
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265517; cv=none; b=G0YDiHX+mT/HHmQZ8hlvEYoXaSJmssc4Tmii3ipG+YhkgtQET+ZOi6nT3N/n5Vp1Cz8WqQMgtmdYkvGiKx8IeecUWVn448sPcoEOf8IvUVW6P8JRco5yHkrm4dlkWH/LPE0MZR1kH1u+or4oeiTHAEEXimxUQUysDAZCp60GMgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265517; c=relaxed/simple;
	bh=NdFOSdbMJ9vf315N4Dc7tSEJ4WJsvUqrGMOnuhhLwgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V3Mt9+5ErtjsmlNyPk0Es45DVnvDSg0CZqhi9q/FlQDjwz7HJcAWM4SsDc5zxQgFMIvGpy0Y/ogtxSQn5lrxLur4Its7YiYdsf2GJeUEbxEy7o6JtZB0z7f18nbAI2rIic0REHiSaKbW+DiizFFccJ3f1iwydZQ7K9hoZsO4z7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mj+PihuL; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mj+PihuL"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2dedf5f88adso270635eec.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776265515; x=1776870315; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNKSDxA3bbuCnyIBU41Bvy1qxQJrNbNn16c/JgR4kHA=;
        b=mj+PihuLAU2N0v1Pt5yuLXNZ/KB4iHM9kYA1xXekuRi2xRCwX+ZEESm/ckMELR1zhK
         EjZCUaD8GifWOrKxkuuB1LmbUzGKow9EkeVTjeOsEComtaRpyp3fypEkT6+tFMCi8yVp
         ojY7BVFkyehiYlGYX70A8Jc/VNnE0ro10o0XPcQiW3OYazUgZF9LKOWWy0aDtc6I8ScT
         zFmg9TVcEDw3SJa76TqaTHzDeOWK17JEUh9PStGLD7NP5I9oyBzrYMGquhqxQPJl/1uI
         ahA+b0/HHoOgj/V45kNS7c3fr8CEHAzlI5nCrl6aAqdtQWPuHgZwk7J01sSddv1C0/85
         bpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776265515; x=1776870315;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNKSDxA3bbuCnyIBU41Bvy1qxQJrNbNn16c/JgR4kHA=;
        b=cjBiJcsZCyZUAmnoTmM4DbvLaVPSPCXoon9o9kIbwzF3hZ5zPs3YY9tsPMavyiKvPr
         2ZFykXz0LZTEP9HaTcMD/P8RDG5wcWeHHxOWaV2fPoLZfMXnvvW9Cav1QuH5e2ioxM+z
         ToUxpG568ZGivy2NF3sMtii/DYyZ4Ld+JLEhsfxz2E4ETYB7+kVn2HzHuxsRTwLgkZ5q
         aNP2jx3Q6g1xxXjBUursQxMeKpzJuo2r+uNNkCtRO4llHTLWzIwGgThPcoddrelhr9oN
         YM8H9VSzENxKDFiSFq4lnWH/HWQIoS+vR8EcZCpCZEWt+bI95MtN4JW2LbdOgnXdrXdL
         HQYA==
X-Gm-Message-State: AOJu0YxTKCi6ZxZaDf5aUxsjfF9C+82Fx8zilejSf9TztxO91QipDsz7
	nBCB3MnPQzNFXBcnym/ZsKCKHiAZREBNe15pmI0zNoeyF2Hd9wogAKp6ugtTeLl43D4=
X-Gm-Gg: AeBDietNYX2PaV8OM6sdcgc8EXD/COdglSxK61e6JP15PT5whPp53+gKOhfInPpjAaw
	VEtNmKxepMvV2m0WHIcRCSC5mNySUU/pStMuKcbgsK6rC5EaffrdQd3c+I8wwyL89Iy8tcYTOyG
	rwX/82PL0jOT9TxlnqbS25F6KPljpkjO/gvrXYERYlGtTrLsY0iL+rJddeN4ALMFk/2c2IoGPjF
	TVIqf40Pgppj5WQp68xhdx12mszwIMNDlVvmY6Ht7rGo8uJUF0k2/PPqUKuuWhf1m/XPSwmRbaA
	kV4urYSMizvCKJ2jV4FU0WRuMu4NecCfa6iDg1oKO8vVsLI5eCBw22uC5E8RWjb/DTEciCxfvc+
	V0p2fkvXRmBNEdUfiAgrddCPZ96nQ86jhvUqShKeLvA/iaYCJ4+X+wcM4n3wJHSIlDcPHvK2ks5
	J1mghSloSK7xg79+8R4Xhh14pbkih4n7DWIcemuNen1QHU3tbRxV1EIv6SKm3KFW6HUeF2pXPHV
	XB7
X-Received: by 2002:a05:7301:4b03:b0:2de:e194:5fb1 with SMTP id 5a478bee46e88-2dee19467f1mr779818eec.7.1776265514977;
        Wed, 15 Apr 2026 08:05:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm2882844eec.26.2026.04.15.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:05:09 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 15 Apr 2026 12:04:53 -0300
Subject: [PATCH] ALSA: usb-audio: stop parsing UAC2 rates at MAX_NR_RATES
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-usb-audio-uac2-rate-cap-v1-1-5ecbafc120d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz7UESUC0V6kYTHDBDIDiBCEh7
 t7Qjm/4/wTlIKzwKk4IvIvKumRUjwL8RMvIKEM2mNI0patqTNojpUFWTOQNBoqMnja0rX02TLW
 zroVcb4E/cvzO7+5vTf3MPt47uK4vy00WJ3sAAAA=
X-Change-ID: 20260415-usb-audio-uac2-rate-cap-38396ea54348
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Xi Wang <xi.wang@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, stable@vger.kernel.org, 
 syzbot+d56178c27a4710960820@syzkaller.appspotmail.com, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=NdFOSdbMJ9vf315N4Dc7tSEJ4WJsvUqrGMOnuhhLwgE=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJn3V8qWpsttcYvcWpZ7+DpLPiN3EMui6pj776coFv27I
 736i+esjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZhIcSTD//wdO6a1W0zjr/JR
 iJOYmMme87uwU5VjU1/URfZ9+TlHwxj+B++YOvnExB0lPCuYz9k0BubO3iWi3fJQydLqUyzPafc
 /TAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

parse_uac2_sample_rate_range() caps the number of enumerated
rates at MAX_NR_RATES, but it only breaks out of the current
rate loop. A malformed UAC2 RANGE response with additional
triplets continues parsing the remaining triplets and repeatedly
prints "invalid uac2 rates" while probe still holds
register_mutex.

Stop the whole parse once the cap is reached and return the
number of rates collected so far.

Fixes: 4fa0e81b8350 ("ALSA: usb-audio: fix possible hang and overflow in parse_uac2_sample_rate_range()")
Cc: stable@vger.kernel.org
Reported-by: syzbot+d56178c27a4710960820@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d56178c27a4710960820
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/format.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 030b4307927a..4830f9f93ad7 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -470,7 +470,7 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 			nr_rates++;
 			if (nr_rates >= MAX_NR_RATES) {
 				usb_audio_err(chip, "invalid uac2 rates\n");
-				break;
+				return nr_rates;
 			}
 
 skip_rate:

---
base-commit: 894f1f133f8ee078d25813ebe10c8c3f396a57c8
change-id: 20260415-usb-audio-uac2-rate-cap-38396ea54348

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

