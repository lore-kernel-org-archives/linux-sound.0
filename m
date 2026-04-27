Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A413ACA6A
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777328016; cv=none; b=nL77hgyst3IAsgsWF2ILNcqdgqaprvAkVf0eW0QPXT9k8GJCG/HRzUxaniEyXLA+iW9PWo4aHY6d+f7V0IL7u86GksRzF/KII9qMlEmk+M0yviG4NxAHO74JY3JqDIZ9AJYJjPl1NnV8TBYRKu0rSkz1BFo16YTNHfalWHZyF3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777328016; c=relaxed/simple;
	bh=PYhtnYqGckhE2YWR1biESc9MwLUwlD48h3xEADUHv14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qAsC+CkG4wsr8R0Wv6YEXBcpO1T++K6X2PjvxqknloEAqPq5DRLDeE9/gKQzCVzj0YBzr/1H6WU6RhxecWEY1Uq0JbAbjXVq2YnivsoNCTpzyft1KF4GEk5pKzaw3JsLMnohYe2TdDWBPFuvzkNnipReT5ndHEqtG1ORlPzqfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQqc9An/; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQqc9An/"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794719afcd4so113181067b3.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777328014; x=1777932814; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao3FwC9SC31+DJ+b35375kjpd4YpXHW0GdgfnI/QqZw=;
        b=YQqc9An/jvwN8c5UpPEOx1T9hdljnz08lpQGo4scoAoOTKbrEg/RYVpPhlrKLVE6yv
         Ub02QnzRr91hIePo2nr52iiGZ4RmyyHiqTQg6MQaXpyNJM57gkND8Fh+9Ti+dDALvNXy
         z73h9KxCz+NtkmCaR8B9xPR2FV+eEhr+6kRIyUFzfP6EugiM3wbjnpvGn62/Kni4sijC
         ErLXme3cyTLEULciFzYkIeF7JQryy2/WYC7jNgEBgex444JxR+r+rfNPmxHyd2bcW6Bj
         +Rqb3mnGtFN4/8Yma0HJ2NuQjrc/SaiMU8fdPDdghszONda+YjoCkoK6NLdXjnUCP9fS
         Tetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777328014; x=1777932814;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ao3FwC9SC31+DJ+b35375kjpd4YpXHW0GdgfnI/QqZw=;
        b=CM8NDf5GNH5qwzUmKJ6AN+uxZ0RcbbOdUnm7m+kQdLkwYeavMsoJC293Al2kzh/Bnu
         aLfbsn51LkjwNHJFNFwvisQK+2qf1Pz/APRV5RII1QH+lZaGHvb6otPAsfAXx1ZC00gV
         e48n1/KC2pTQfIZc1X26N6NcmBeU/lJlnZkqUO1GKn3uKSZRPvxTbqRzeLneXuwGgxgW
         bmdsvdcWeAYIPEarWf0lJMu3/+cA1PipiFQVYr5AEV4WUOoQro0vcRx//je3ltk+Tm7d
         ZrQDMxwGgY4jPhz7t+j8/qjxFMvJUHHXiyjhs9iOXs2fvPoDil3CGdSk2iC+HhlYns0X
         thaQ==
X-Gm-Message-State: AOJu0YwONGYrmE6WgY5uSM+IZto5Z1SIPLiEQ8a8WLiJA1E2DwETsQ2G
	C1xjJNWduifZcd9axMC0bEPgocSSYkO+MdUuLUgqODRY1aHU8YtR7c+c8THQSQ==
X-Gm-Gg: AeBDievflJTkEW47monbHPgQm/SFnxBcHVXoM+Hl17F0sqoKCx97otsBXIqa5A516Pu
	9hV740E7uXhVu5OwMFpi1FfsGZJ0uU9tX2K7iJ5Cl6RlmuSOwNSNIFhfkhmTmbMhcqaXclSbsm8
	xJCIXue5eCdfBURtkZW37So2K2+OSG1YU1mCsqis7huEAcjTfM2XyrgAg2OcYsf0hAusGo3aC/f
	DOiEq/o8B4miDeLjeGmxYQoO6GlbuyC5rkMwL95PRq6IrmVSn30FpOe5p/KdHMrf5X3ypMUp3Wr
	k5xpHIGy04OyWEzO1lB3Itp8CelpfC+wyywsal1LVp32Nsybvci20xt3sqKg7nSVh41AKd0OTsp
	icerRa9uHImxOVWMZGCz/B5ykvfeWNT1oGjiChyIjDtrfJo3igUHOXBmyKs53wdX6D4DdW7yozO
	94xSsx17n3RKP2jd0/oc8NWBiS7NJeipQFTWdvS0LvavwcPVyAns8JsaM/TaZ/HwRYFzjv8Y6IW
	lD/Gdr/Zviw
X-Received: by 2002:a05:690c:6ac4:b0:7b7:5f48:d9a8 with SMTP id 00721157ae682-7bcf579f246mr4337777b3.43.1777328013940;
        Mon, 27 Apr 2026 15:13:33 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf0d1eee0sm3590157b3.42.2026.04.27.15.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 15:13:33 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 27 Apr 2026 19:13:28 -0300
Subject: [PATCH] sound: oss: dmasound: kick queued output before extending
 tail fragment
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-dmasound-sq-play-v1-1-28bbeb8509b1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTMJjFUDVyEuSjvoGCjQEYMh3
 N2iy7f4fwPlKKxQZxtEfovKGBLKPAP3sOHOKD4ZqKBLYeiKfrA6LsGjzjj19oPGnB1R5ytzIkj
 ZFLmT9bdsbn/r0j7ZvY4P7PsXDaGdi3QAAAA=
X-Change-ID: 20260427-dmasound-sq-play-445c22fd9432
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=PYhtnYqGckhE2YWR1biESc9MwLUwlD48h3xEADUHv14=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnv73cXSAdc38znGLTM3VJ5m0vWE759YtxJ4ud15r+b3
 NdVmxTWUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABNpucTIcG3lvat1aTsvh16x
 KVtSGMWU2ia+Upp90wYf/+YFk4wvzGD47xw/i9Ox5OnTDzUei74WJl7aLZy+v3XFg8V89drfl+2
 czQsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

sq_write() currently clears POST and then immediately appends
to the current rear fragment.

If the queue already contains complete fragments ahead of that
incomplete tail, playback is not kicked until the queue-full wait
path or the final sq_play() at the end of the write. That wastes
the slack those queued samples would otherwise provide while the driver
spends more time copying and translating more data into the tail fragment.

All in-tree dmasound playback backends still refuse to queue
an incomplete last fragment while !syncing, but they can start
earlier complete fragments.

Call sq_play() immediately after clearing POST and before extending
the rear fragment so already-queued complete output can start earlier.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/oss/dmasound/dmasound_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index a718b75bb6a0..e80f730d0803 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -574,11 +574,6 @@ static ssize_t sq_write(struct file *file, const char __user *src, size_t uLeft,
 		uWritten = 0 ;
 	}
 
-/* FIXME: I think that this may be the wrong behaviour when we get strapped
-	for time and the cpu is close to being (or actually) behind in sending data.
-	- because we've lost the time that the N samples, already in the buffer,
-	would have given us to get here with the next lot from the user.
-*/
 	/* The interrupt doesn't start to play the last, incomplete frame.
 	 * Thus we can append to it without disabling the interrupts! (Note
 	 * also that write_sq.rear isn't affected by the interrupt.)
@@ -598,6 +593,11 @@ static ssize_t sq_write(struct file *file, const char __user *src, size_t uLeft,
 	write_sq.syncing &= ~2 ; /* take out POST status */
 	spin_unlock_irqrestore(&dmasound.lock, flags);
 
+	/* Start any already-complete fragments before we spend
+	 * more time extending the incomplete tail fragment.
+	 */
+	sq_play();
+
 	if (write_sq.count > 0 &&
 	    (bLeft = write_sq.block_size-write_sq.rear_size) > 0) {
 		dest = write_sq.buffers[write_sq.rear];

---
base-commit: 702806986e6bd2b2b37186be47aa63774bd62198
change-id: 20260427-dmasound-sq-play-445c22fd9432

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

