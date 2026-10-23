Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792789888;
	b=IAk5XI41jtNNAkG2xo/0FwdVkNfwNfNiQufgU5yggR9was2WxPYI4fj2cBH4b0nofbZU
	 66RkCIXcsQwQh9BRVfAtirB3ktEqvPyv7HAq5bktkumO4fxhz2qlltp6kBsy5ucllAPcV
	 yALov1x1gdxhOklOPpzMurtfeTLf70z7Qh5gZv0jxqngtY5KtvO1cJ2Iv+GurwsI0h4gL
	 04a78tgrnvRMiWI3WxlygWxbd31PrEOKaI79L3ILhmcP92x4vcpi8IOtQ1TeDHZLpll02
	 BlaJH2rsIPX8SpnDXQQIVGo+PY31ZVAKzUjtPeCKTbIqTGEELar6fVVP6zdDqPbFZdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Z5W3YqAiuEHHNgCmWNPu2h0CpdPIOg8Syx8Os9bGaY=;
	b=ZxAojH3e5yB1KUuEoUYPFUnLVFAF/Ni91vrTx0wBbyLCWuMzlHEqZrb74yai7zh3UMQT
	 +gDa+DevAsBUNMmbH2bIXN4kyMr08E/VnctC/1HH19/t9/6e/Ju6Jd3GyXhe6iRWkpGkk
	 SzwERc3wUSmlzrLh1e9fWQdZb661PVSIaVEN1GloRe8Cbn48rXhGRi+yBKyryXcTEnIvg
	 U41vcPjpSSGcfBObtUZWcb78hH9CPlMq+eAyafsOkghX4f3k1EFnYFD6/TgTYkGvUQXgW
	 ekeoqAjAhQuJRbUyFt28rEQYZHgfw276DsKBsj5VL/BbLEGu48zoY0Sodrd/DVmG49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dp37n/MZ";
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B2606A323
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 21:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63B2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dp37n/MZ
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e503815adso133861185a.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792789887; x=1793394687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Z5W3YqAiuEHHNgCmWNPu2h0CpdPIOg8Syx8Os9bGaY=;
        b=dp37n/MZgj7A1eeYByBqhUWFPzQVyoQz7k+DAfUetz91bczKXNyjxgvWpvAlqTDCUj
         oBXFal/JZ1YDquCo56cFjSsP73VW0umXjhc4+SIHy9VrknZfDySfws9bZ3erVuwxQkey
         4obB9o66pgZAidNHx32EWJnPi91pSrEvzWs2NMr5pkUyoOzIJIl++cXcjMBo38vQFpPe
         aMOHthTNhDDXpYUaJiLjjUYwgo/XWb5O+QbAFrSUBJBPyKNtXo9oV5eofeXu7lXp0JoQ
         41twTQhWrfGOZXVyH/4sNOnwVq+xxQT/schkKtT1URM/Msg2hIT8KFSFdqHa6vY31Kf/
         kJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789887; x=1793394687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Z5W3YqAiuEHHNgCmWNPu2h0CpdPIOg8Syx8Os9bGaY=;
        b=QNmXAvOo8Q4gS/NfaYy1oByjmSwMGalSFP/q48C07dgkNXzDr12q688PhrURXv7esq
         Ljwlptvudr5nG7zBzKzl/UGvMI2fm6bLs5IAXdp62nBHw52lrUF8PXRr4mEnjWIJrEfT
         4rQqtv08yhb0mAk27paLwQZkUDDAR3U8Pi1cfgw3eaheqw3SZ6/3L7lehht06JEpcklk
         LJmLVH32ive/L4TiD4AZfSu/sCN682i7W6NBl68YB9FGxAnpuHuFYD7iK/oDXIVK0KDm
         sX+i4Gs3JPzMm8Npg8KUZfgZl3hBUSRSSo4IXoKY29hV+JA/te6bsgPN+ZaTYY0II9RO
         diDg==
X-Forwarded-Encrypted: i=1; AKwUvBwkiE5cgub5er4SSO7eYhtndqlIXYhC7oTLAXfs4Zbyx8UmmU+UREqB08+FVkP/FZFs5LNo5uBQPkp4yw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqJlxQJJGZRCEqEuXLlMAqOt3zjIXphwCgeiy5XdyX4HtV15h3
	6e3UfQQasBdFTg18/eNnqv3+kFPD1i1qIXAyxk2dOthjFVZw2xj1kDKc
X-Gm-Gg: AYBFou0s31DCE8Ya/w6QR2W2vQBhUxJgxVDAhF+yr4Nd3I/S2QAMsC/oXYVB4gPRGra
	Gwi40H9uUcMfZMYtqyfjPbWrTA96jX55jWe3Zo7UjrvqkT6F95aooH8xFC1g+0gjS6TK7+3VFsU
	wShND6bsYxE2IkVONAbqdyMEtpjQSRwfEDDtuDIigGtv455XZUnHN6oLBICTFQX53pWQ7teosTv
	anIzqINUubiZcUZa7Zc/pZRy5E93u2HysBCpjmj8miZvJpBvHuqUQwSuPtBi5ZPIlCJwhnJzbsK
	T+TslAZ5zVXHncqKiZZPzNm41/AA/bIiYLuAznrp9xg6ksmkIT948xj+gwUQIz5TCCHR7f6foJc
	6byN4Wa2RUOaBg8AH3mAh8YVt+UtCaeyiYRY6F2JFNM5ombiC5GdZZUr4pqFbmZOMWxL6Jq2v7z
	9XBgy5mojjX/5Rfctlg1+R4FEIX+zD3k7IusxEUOeVztLqzJ25SkANcUqKRZT1AyKP0mJO/qIpC
	auyjFxZZwWQ+3MX2Nv6lGLLYjQfwGjGGc3Kmm15+zXCaBnt+MTGgxRZ/isACe28uA==
X-Received: by 2002:a05:620a:4556:b0:93f:12d4:67cb with SMTP id af79cd13be357-940ef9c4921mr36665885a.80.1792789886653;
        Fri, 23 Oct 2026 14:11:26 -0700 (PDT)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f066958csm9222085a.15.2026.10.23.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:11:26 -0700 (PDT)
From: Changyul Lee <lcy8047@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] slimbus: messaging: hold lock until transaction is completed
Date: Fri, 23 Oct 2026 17:11:25 -0400
Message-ID: <20261023211125.2738290-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

slim_msg_response() releases ctrl->txn_lock right after idr_find()
and then uses txn. If the request times out in the meantime, it
returns, and txn is no longer valid.

Keep ctrl->txn_lock held until complete() returns, so the timeout
path in slim_free_txn_tid() waits until slim_msg_response() is done
with txn. Call idr_remove() directly, since slim_free_txn_tid() takes
the same lock.

Tested on v7.3 with a delay after idr_find(), in QEMU with KASAN
and on a DragonBoard 845c. Without this patch, both reproduced the
use-after-free in slim_msg_response(). With this patch, neither did.

Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
Assisted-by: LLM
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Changes in v2:
 - Add a summary of the test results to the commit message
 - Remove the blank line between Fixes: and Signed-off-by:
 - Add Assisted-by: tag

Detailed test results (QEMU and DragonBoard 845c):
https://lore.kernel.org/all/CAKefsHuMzUr6LForJnx4ZQiBUMLQm60_iNEKmjxnGDTVxr88Cg@mail.gmail.com/

v1: https://lore.kernel.org/all/20260911045911.1327413-1-lcy8047@gmail.com/

 drivers/slimbus/messaging.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index e2dbe4a66b70..aa98f5480ba4 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -29,22 +29,24 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 
 	spin_lock_irqsave(&ctrl->txn_lock, flags);
 	txn = idr_find(&ctrl->tid_idr, tid);
-	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
-
-	if (txn == NULL)
+	if (txn == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		return;
+	}
 
 	msg = txn->msg;
 	if (msg == NULL || msg->rbuf == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		dev_err(ctrl->dev, "Got response to invalid TID:%d, len:%d\n",
 				tid, len);
 		return;
 	}
 
-	slim_free_txn_tid(ctrl, txn);
+	idr_remove(&ctrl->tid_idr, txn->tid);
 	memcpy(msg->rbuf, reply, len);
 	if (txn->comp)
 		complete(txn->comp);
+	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 
 	/* Remove runtime-pm vote now that response was received for TID txn */
 	pm_runtime_mark_last_busy(ctrl->dev);

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

