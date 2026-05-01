Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCFB40F8D6
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777659787; cv=none; b=p4cQg1psJnPcqoe0B2AJUJked9r/l8dfA9UQHEsORu9XxG9PoUXNFHfWO35ZpOfOBBrf/eoI8YAZPUqQVkJ7u7TvdvNU/0iUqYFSCucYR1QOmrl1NtqMXLVXPrs2UHP5mQGXj6JekVjTQrEPBLlAnigYhxwFtqjjCUvRGblLzeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777659787; c=relaxed/simple;
	bh=SVi8OGcFQK9lZRrLuOntWSN6V+qhlhdqgyG2gVPyLdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GmtMA5xVXxvJPKMn/r3KFqOZ3YzKmuEy/j/OqnAx/nwewqlKkGleqpn+0GhIn8zj7t3dEVKai9mtaDkrHbqRvQYY5FY9W8QEp/h9M97GESTwcPmirU6E3Mfr3KPVBlOHL8Q2LbkFqMVbaRVszMV02B8wGFy8y/Nwhxd6XN3QhME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m65Mbash; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m65Mbash"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c726ef332so3482424c88.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777659785; x=1778264585; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GLMoGsBUlC+X0dGT0ghykkSOnQo8Jg5A53fEDIQtS04=;
        b=m65Mbash/ozRr3MOwpXi1yKZaB6rG77kw55N5XtScnqSQXXQiDAQo8tl2juwcQOAKr
         iiljU0Ta0hfBZ2b5A5AqfGinVQISkcDxNYltWTEPs0YYMvBxqJMlGsiVoHVWrsbMkcSA
         DCgailzWMPl4JFpYCNaNYXdy36oD5YKAhzDnLNywefha37GK5EET+/1iIoIOE5aT7pZg
         PSSwAsrZgpHHmrseSpYbH4BpA3nA1C+hvc46QzbyC64V0ZWytQOlxgWtpMjyFrNPtuN9
         mCkP2dqhvqRhV+IHSnUU/QgGEVHRmBp0Fb6/3mWnjzsuOFreaU0awvX9BMIPLooKe24H
         aJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777659785; x=1778264585;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLMoGsBUlC+X0dGT0ghykkSOnQo8Jg5A53fEDIQtS04=;
        b=YFzGNiXCbQmBpcbxSSqEyLWxJLLPvmTHZZVCuQFucrOlDYkk/OidQPh0GXV7Ftzg4L
         VqZa+I6aKt10gnyPcQA/zCLbcVK3W3ft4ZmKw2TB/AfTawqKbQjKIfh5LG3ZfG/HmdJy
         YsFB0IXAcVEImjUroaYt8RXFNIl6Np61HtW+WjZsngYBnzsWHfJWEgvrbiY6PLMroiLc
         PubmpYp9Klv/9oQ6/ZLn4hdyrbvc8vqcMBsVwh5Cx2wvwNBmB6S+T/NVHW6R1f2ar4kh
         WEG6+E6qFTzUITE2ZPAZgqCHaPuJLjMoQl0/Klrzrc+aC6AXwRckAWJTYdUTs5td2yll
         8iDA==
X-Gm-Message-State: AOJu0YyPCafvS27lgyEB49ToYTLIrXKkuvhjfvCP03XVDINNl8LubDuC
	CE05BBH1P0rrS4gPvWOqn9HivBlnWt+2wQsATpG9TlvxQCMOnoxXXdnNzC/4NKhv
X-Gm-Gg: AeBDiesM8tO6pncuRJ7ZtWsLw3y/xmrTC7gCi9vbwi/040w9kXBLLUi6caRQ7x65fhQ
	Ht1IWV3JJakpt/CoWpzSBPdwFLJaZHPS0U4GTgXiA+TnsVM4k9hObXF92boHzSfltFknYd8DRQi
	onl280lEA3JoXGHr6fhOHVT2lmykX4u4kG1vg042mn7e9xNIyJHK76HehiJ1W49HXIqdMVJislu
	O622ZyIy3OmHKD4RbMKPbMcOSlyy9ybQvYqWgMOa492h2tDhC4QfHNe/zPKFUzBWTfdqtriYWKD
	6NgmJ10SpytUhcpOrvoB7YFYEpJhZMU0BsiB31v1nO2+B9+5Wu2x6n9D/clHS0uKhPOwu8JXNBG
	nnVZokmLG6M4w64maGkIc+qDKHnPGYnkV5Mo9dikYrzdyEbN2bJOes4swEDdy5736yx9Fiio81z
	JrF93awSuI1MahVmXNB0TPqKQBc8Lyh9oKNHv5dr70gfedr2Z4YmtwFYN32PfUuFQFF38GwRWod
	l5fBFDr1Jg/
X-Received: by 2002:a05:7301:228f:b0:2dd:6937:79cb with SMTP id 5a478bee46e88-2efb82b272emr220762eec.12.1777659785240;
        Fri, 01 May 2026 11:23:05 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71cedsm6590624eec.9.2026.05.01.11.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:23:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 01 May 2026 15:22:58 -0300
Subject: [PATCH] ALSA: firewire-tascam: Do not drop unread control events
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260501-alsa-firewire-tascam-read-queue-v1-1-7baa4ba1a4de@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMBCE4Vcpe3YhKVjBVxEP22SiK1o129RC6
 bs36mEO3+WfhQxZYXRsFsqY1PQ5VPhdQ+EqwwWssZpa13Zu7zzL3YSTZnzqeBQL8uAMifwuKOA
 DBMm7zknsqVZeGUnn38Pp/LeV/oYwfrO0rhsMvmkKgwAAAA==
X-Change-ID: 20260501-alsa-firewire-tascam-read-queue-7eaef1060adb
To: Clemens Ladisch <clemens@ladisch.de>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=SVi8OGcFQK9lZRrLuOntWSN6V+qhlhdqgyG2gVPyLdM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlf3rdeq72b6CQ5wyFaaCOvq9I/jkS23GlMW0/eFVJdz
 jhp6YNXHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRc/kM/5T0lRl+B+kIsQcX
 SH3LUWPhU+nNP+Z6drGZ5/cnD8UlpzH8z4mZ2HHiPP+vCe6hj9xv6zdH/bugM40pflYFG8OOvXe
 C+QA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

tscm_hwdep_read_queue() copies as many queued control events as fit in
the userspace buffer. When the buffer is smaller than the current
contiguous queue segment, length is rounded down to the number of bytes
that can be copied.

However, after copying that shortened length, the code advances pull_pos
to tail_pos, marking the whole contiguous segment as consumed. Any events
between the copied portion and tail_pos are lost.

Advance pull_pos by the number of entries actually copied instead. When
the whole segment fits, this is equivalent to the old tail_pos update;
when the buffer is smaller, the remaining events stay queued for the next
read.

Fixes: a8c0d13267a4 ("ALSA: firewire-tascam: notify events of change of state for userspace applications")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/firewire/tascam/tascam-hwdep.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 867b4ea1096e..dcd3fbcbeb79 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -59,6 +59,7 @@ static long tscm_hwdep_read_queue(struct snd_tscm *tscm, char __user *buf,
 		unsigned int head_pos;
 		unsigned int tail_pos;
 		unsigned int length;
+		unsigned int entries_copied;
 
 		if (tscm->pull_pos == tscm->push_pos)
 			break;
@@ -73,6 +74,7 @@ static long tscm_hwdep_read_queue(struct snd_tscm *tscm, char __user *buf,
 			length = rounddown(remained, sizeof(*entries));
 		if (length == 0)
 			break;
+		entries_copied = length / sizeof(*entries);
 
 		spin_unlock_irq(&tscm->lock);
 		if (copy_to_user(pos, &entries[head_pos], length))
@@ -80,7 +82,7 @@ static long tscm_hwdep_read_queue(struct snd_tscm *tscm, char __user *buf,
 
 		spin_lock_irq(&tscm->lock);
 
-		tscm->pull_pos = tail_pos % SND_TSCM_QUEUE_COUNT;
+		tscm->pull_pos = (head_pos + entries_copied) % SND_TSCM_QUEUE_COUNT;
 
 		count += length;
 		remained -= length;

---
base-commit: 9e8d6ddd7ecf2ad42d614243f86e50fcf0183b9e
change-id: 20260501-alsa-firewire-tascam-read-queue-7eaef1060adb

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

