Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835691531E8
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 00:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284635; cv=none; b=OIaVGVq1QVGQ/5CeNYucskgCIfKQO1jqAf29Lm7hYZCnRMBpz/LDxJhTRD96XOGC7k3j5oryJhijdNBnteLX9VKwFwN5C0s3AB6H4pgmOaxvwKlCqBfXp9Newq/yo7SzjFnMNEVY9teKIPPId+VOv/xgUKRMJ1/srPQEw9He2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284635; c=relaxed/simple;
	bh=BQwtZ4wkF5S0F7WfVDgfzAEyK6GgwhFfBcFMZaGmqPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJ6VL2RF3gGkaO0KVIyN0Ray4x7+XMHidKdGNMUUqxxshU5+HWRWDaCayMyN+kAUmAVHEaM3xh3czrBwkIsw5mmtoxm4XUc/+bt6iKGqUWwmywdA7GNfiDgtdpjyTYbEqGq7fBhfPVj+4LPSKaqax1hxU3ahjYnhIDFEKqCParE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLrXUw52; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLrXUw52"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca7c1176317so284070a12.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 17:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785284634; x=1785889434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrVoGn4sblzpENqt/97YSRnRGJ1nhNOn2U1+M+l6hfk=;
        b=rLrXUw524At0XXkjG78WQYByrRmgSBDkLlS4PVsW9uyfbtI65ieRWrp9KMXQAlQE9V
         60nqZl2rkELUN0Ncpgx0Z84bYa+mmwFeUhXW8KSDE9uEV0IyX3xuo/88QzH++zz7v2R4
         RpYathRlRcCOk2l94+URnzsYOKyAMaNpRQNeFzi5f5kZrExTORd1auxG559JzVOEWdUH
         UVCmS7X49pyh0NJB4e+gTxZAPV3t7CoQ1WpuihSFikQDH9hDufYstO3VyMIV9TaFWKau
         24IJJjghmL8CwB+1MPBF8rCdTDFuhNqLY1dLltSPNW1EQUDUCkiqeAdME0P/tO+FRcA6
         GGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284634; x=1785889434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrVoGn4sblzpENqt/97YSRnRGJ1nhNOn2U1+M+l6hfk=;
        b=DKk9uI62qxxr05dC1e79m3k992yduwWy+rLzWowny7UQGlgvxbLmAYNjQdoRSyQNmg
         dYqz+864xCtg2IySgUcwY9FIKPVeFhgXQUKufVBUgefkOZJ1FU0n2jfo955FqzMAHVZs
         g0e39iUKbQOBFO7WpeMgRMfuctc7YpEQUd1OsWgT24bt8GtlCx8EhGs2/hODMcKrC6Lb
         1XVNec/7VyalZD7zN8Hlf6ApNx0eoORONXm6h2ow+SDApD9ZGFRJXGQEMHedNq+FPvAM
         YdCETpYNDQeVCEU38W7hs4sgVrT7ElCPvtKukn0XgQ/usCmxsoN/rihGhgPzRRWLyEv0
         iKVg==
X-Forwarded-Encrypted: i=1; AHgh+Rpd1OBocHBUJ7dM1NI5eMUF38kvGiPdhEgDSowDech0nDea5E3kzAVzSNDjb+sj26r+rbDRajdeQqWq0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbr/25k0E2VKpH6deyzffNHtoEwJMrpOfM2azeJ/+fnGNY8eop
	QvMbyRzVkUAjrNfZlBQ1edCe5IRW23+ge42pKMAkBrYtm68HRwMPbfhu
X-Gm-Gg: AR+sD13fM4SSagidmR2m219lNUxFKZess1UiJWBdHv0JXZYNf6JbezS6Uq9GzulI6Md
	Qbf4SjtsUr6xtCk00N0Fyp29pTy7ZWBGtOvNmDs5xverKd3OTMrFCD3chL+cnFMBN86hhFTPBvu
	2qoVLuI3lYw6OFr1Y4YhYYnCGY5rpkfbyLzGrIVl081JhYqCLQ5PSFNOcgPRBaBs6a8A+49zzvo
	vGexiuM0MjooXrf7Z6aU792lSLlnudzF1Lcz0sfFJGD/UwKIOY8mJPZz/q68qHC3WaMuIzhGFpl
	78m5J8EjAvgEMjx2cNJfOQ3jS6cO4shXqcJy96sm7NBSe5P3bDcBD0XW11EsQWWKcXRrbgo//a+
	wbCrmr/Y6TvCs7ezziV7YmggdiHr3FuqYvzEgKFuGENq9Uzf6RDaSG5bqFj7V6hQr0X0/tn+JuT
	9SvJFQ2dXMngjsT5W+2wqUpFGX5sW3pON6zAs/mRlv93dfm1XhQSUHxIO+Pz9radMjEgbcFCCK9
	JjIH7zXkPK6SDtok4dNgDwLyXe1C7grJho88LlLKyxk
X-Received: by 2002:a05:6a21:3381:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c8ba484354mr5970148637.31.1785284633878;
        Tue, 28 Jul 2026 17:23:53 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:4684:f08f:7d61:c1d3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504db2c4csm3015068eec.28.2026.07.28.17.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:23:53 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+b6cab840e6a85641c7ad@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: ump: Fix double-free of ump->out_cvts on legacy rawmidi attach failure
Date: Wed, 29 Jul 2026 05:53:33 +0530
Message-ID: <20260729002333.11525-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If snd_rawmidi_new() fails inside snd_ump_attach_legacy_rawmidi(), the
error path frees ump->out_cvts but leaves the pointer dangling. Since
ump->out_cvts is a field of the long-lived struct snd_ump_endpoint
(not the rawmidi device that failed to be created), it gets freed a
second time later during normal endpoint teardown, in
snd_ump_endpoint_free(), invoked via snd_rawmidi_free()'s
private_free callback when the sound card is released. This results
in a KASAN double-free/invalid-free.

Clear ump->out_cvts to NULL after freeing it on the error path, so
the later unconditional kfree() in snd_ump_endpoint_free() becomes a
harmless no-op.

Reported-by: syzbot+b6cab840e6a85641c7ad@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b6cab840e6a85641c7ad
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 sound/core/ump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 70520c7ca293..632c13baf21e 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1365,6 +1365,7 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 			      &rmidi);
 	if (err < 0) {
 		kfree(ump->out_cvts);
+		ump->out_cvts = NULL;
 		return err;
 	}
 
-- 
2.43.0

