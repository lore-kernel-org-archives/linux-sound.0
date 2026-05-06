Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0F32BEFE8
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778038495; cv=none; b=Q5sqHLJpfld/Cp9DsQI11NqU6DDFnHJEUNZZKZrN0iw52Mg30a+8a5+45WtMJKD0/4L9DRg4s7elVFIvbAipRd2wN0WuXNoLz1YiQSCJqOMEE7ZE+czvATTLYsWoUWg3dCqg7kYf+C6OWKlic043+RHbRZPjWh8Vj5Z6mfJgjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778038495; c=relaxed/simple;
	bh=aGl0FFslKa/Rl4d04+/BDVaWg4vCkgnn57v9of+wR7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r7wNxlbWV9ynoeGf+pMhj9bqvD9LwHOIVSL9UDkF/6mJiRlxd7/dwEadXeZtOvSF/Mwnv9LLjDMDzg8KdTUw/SoS7YGWrZDhngXntB+sq2plaOdC1/bnOVW9YbBPpKgZ/TcQwMddSijMo6xOryddejqaCRpGYRzaiXaSDSapX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inkirFqI; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inkirFqI"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12e332315a8so1202021c88.0
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 20:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778038493; x=1778643293; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UV5FKrfWHwBi+1GNXlHYzL1K9RCWMMuYYjYFQ6+sCZk=;
        b=inkirFqI0V06POq1pn0uVjKtm0RbGKNElaZ6gTvF/atAnDYuBqHJ7tpPdEYfF/jB5j
         5mh1meOYrK1p8r9lhSp4q7mgjYx+CI2UyjiWNoHBN+63KXhd0RcfU3MuPF9kx68/Xxg/
         N/qEgg3svxa12SZ1PAPCQjhQS0ATmzkd+Q8RdzKmj1rMkSaf6xAX20Mfe4lml8LNLfuF
         C97ovDbSxehTufHuThZ+bTyJ73ixC+pZ6mz++xV7btVaFQ/0awAGR/z/KxQHOXWurE1J
         5ewbEHUe9xMCmDPb4B/f900YSdHK+Dtwfi0yBc4qi5/O6cTWXCOmFoiTwYcb7sN6En1M
         shrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778038493; x=1778643293;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV5FKrfWHwBi+1GNXlHYzL1K9RCWMMuYYjYFQ6+sCZk=;
        b=o+GBdeV4PD5MNOApqezOR4tayGP4IMoSc4kSDKNQEDIeoF+qPQ/3yilrblyn/91e77
         u42Q3tMxacmZAgZbKDK5cmbH6/O0XeWixCFIpdXu8arj+f8qv5hzKqXJLN6HAHwgHaCi
         zq6Vo3WiOkZfA20Exj32AdcTHQgof1xGxLRQ3wa0Ykf/vePlwLjSYbi156rjOVf2zSMV
         W7nyFgtxPFlfErMgmhchELAq9VGw/B04mFx3MBvf/nt8lGGfeOO2obrRLGalLeNBbs/L
         4e5AkHcxB2gl7UtOaxEjl7YvWmyIXHqJpP2qJgRNvi0NN+MvHF/cuu7cerYoyFFYfWdH
         8SdQ==
X-Gm-Message-State: AOJu0YxUbaX5DgQV2XZEfsjVsQ1z5PsCgidd60mc70bcFia2+Y8yrHBA
	NRcUDxCJ2RMGncq1n50jFr5ar7lZ0ZRpM3WdbcBi2zzST7hPiuqg1WVy
X-Gm-Gg: AeBDievlQlDa9+aFVoUJ3J1wUOcrvU35fbyjK+vY3rOUH1f7ceDNettF2ibBYnTr3/K
	L9ll26mlhsM1f99kBMNW2KRth+2syonJWET+Ar8KqK55fCP0/GvjnBMG0pAusmFJiyN3NM8J2np
	ZO2PvKit5ILOJKpsuIkS2LufaxKB7XPM6oWrjUELdFEhXcnBsJeiFpEcLHK3YyAnZ79sxxLvO+Y
	N+QqRnFuttB9SZ1961+PTaYJaRMwipXoLqHnBCjIuJDB+AFi7NxhrImteda7KiNLodw2RCLSKvC
	0jIOXX5UKF4hEgt/lJ1jeyOctaehHkM74fCR3FgLU48FPkeH0ua3I+93a1B+ZLdCZDodDqGnPoz
	QYKp2peLdbU4AxxosECdC3WDnbCuBbvLtTiXgd6D+UZOd4JvYtf+jVS11IbZqYZXuxDFRGmWVEe
	AQV2cRpbXZd8gak7TuUH2InztO79Mbl3doHOsvjv8hPKtN2peQQxGq3pPfURhfwMQZ4lBcFOF9e
	w6HTE1/MA3g
X-Received: by 2002:a05:7022:4593:b0:128:d51a:5161 with SMTP id a92af1059eb24-1318e7f7f75mr1073101c88.27.1778038492984;
        Tue, 05 May 2026 20:34:52 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-131f9789e3dsm1787536c88.8.2026.05.05.20.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 20:34:52 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 06 May 2026 00:34:47 -0300
Subject: [PATCH] ALSA: core: Serialize deferred fasync state checks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-alsa-core-fasync-on-lock-v1-1-ea48c77d6ca4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDugQYX2KqWLZJzYUUlKphVFv
 LuxLt/i/w2Uk7DCo9gg8SwqMWRUtwLobUPPKF02mNK0ZW0M2kktUkyM3uoaCGPAKdKIDTnqmsq
 3d+cg55/EXpb/+vm6rD83MH3PH+z7AYoGiV18AAAA
X-Change-ID: 20260422-alsa-core-fasync-on-lock-5cbcd51f69bb
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=aGl0FFslKa/Rl4d04+/BDVaWg4vCkgnn57v9of+wR7E=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm/tt2ysy66Vstpf2JTypTwdc53Ijseb0lYyMvG7mB0m
 c0sKuRWRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzEzIDhn5Wt8SbRmUJBF3qf
 Gi5+La35/92Wlf3lf66v+fYx77atSzkjw+MV+5Yz2wek6K9bqStxqVt/ZijLuY3sy2I+13Yd/WA
 hzgkA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_fasync_helper() updates fasync->on under snd_fasync_lock, and
snd_fasync_work_fn() now also evaluates fasync->on under the same
lock. snd_kill_fasync() still tests the flag before taking the lock,
leaving an unsynchronized read against FASYNC enable/disable updates.

Move the enabled-state check into the locked section.

Also clear fasync->on under snd_fasync_lock in snd_fasync_free()
before unlinking the pending entry. Together with the locked sender-side
check, this publishes teardown before flushing the deferred work and
prevents a racing sender from requeueing the entry after free has
started.

Fixes: ef34a0ae7a26 ("ALSA: core: Add async signal helpers")
Fixes: 8146cd333d23 ("ALSA: core: Fix potential data race at fasync handling")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/core/misc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/misc.c b/sound/core/misc.c
index 5aca09edf971..833124c8e4fa 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -148,9 +148,11 @@ EXPORT_SYMBOL_GPL(snd_fasync_helper);
 
 void snd_kill_fasync(struct snd_fasync *fasync, int signal, int poll)
 {
-	if (!fasync || !fasync->on)
+	if (!fasync)
 		return;
 	guard(spinlock_irqsave)(&snd_fasync_lock);
+	if (!fasync->on)
+		return;
 	fasync->signal = signal;
 	fasync->poll = poll;
 	list_move(&fasync->list, &snd_fasync_list);
@@ -163,8 +165,10 @@ void snd_fasync_free(struct snd_fasync *fasync)
 	if (!fasync)
 		return;
 
-	scoped_guard(spinlock_irq, &snd_fasync_lock)
+	scoped_guard(spinlock_irq, &snd_fasync_lock) {
+		fasync->on = 0;
 		list_del_init(&fasync->list);
+	}
 
 	flush_work(&snd_fasync_work);
 	kfree(fasync);

---
base-commit: 0d672ef050d4e1c3891c9944f72c85769978bbee
change-id: 20260422-alsa-core-fasync-on-lock-5cbcd51f69bb

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

