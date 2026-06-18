Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84EA2E7388
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781751131; cv=none; b=isRcmiD3CyITq7uHZV0B15GlkUBLKjxIkhIGWT9cQDnWud9js27xSjYbaUQJ5H0APuI60F4d481l85VzIvfIquBXYX7k0cJ7bQNPWJKtcRZxLzyD/1Kh8Wj4/R0NP0J5c/hrSFz2NkMzkMriwcAY3a6VKdlY8Gcak0z6/otOfvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781751131; c=relaxed/simple;
	bh=uFI4CbaVHbw7LY/kwNVwR1mG+tDSp9TjV/HGSQ8Xpbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olCvn6t4zfiW5V3msyow9d2Fc5esjJOE2nhmUrWxYM/hwKjTGNfrXa4jXzc93o5OdyhZP2sRNw2u2jkFJ9aRfwKAbIuMM0ZcVpw2sN2gkuz4VF7exOBNDBybZGSJiF6uplJlMSJR9TXi+0ou/F7e9uvRZjHzfdmWJH4Uyw3GIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RN5ew6gd; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RN5ew6gd"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ccf887de87so5230586d6.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 19:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781751130; x=1782355930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNhazWWKRcLlrWnSm3UA/eAJwz8pGaK0KJHTqjj4RSA=;
        b=RN5ew6gdenIg1iqlSKygLE1TV5rK2m0vPkAOtvrwlPUCBjQGXRAkWeOLeInvu4BIIX
         HquYrCmTYDi5L7lWPXMZFBTRRJW6O+mTe5SygQ25YO9CafofsjxhK80hMEA6tw/PHoPJ
         b15teHI4S6I5HWPGjzYtUNKYNnnUrLM5ZSjQfePNWTjAlfJUlgdBquJHj7TtfIjviwDL
         o1p2SHbwftyiJk3N/FtpiJML3mCTgjgkA8oUmYnKTmRyg0rJvvVLDSUN4VPWw/Lg40Lw
         wAlY9bHGxwbX55do9jc0l1HwTeXCsjKpjc0a7aeJGffBOWBJBoQ32YInGJ1vSkaPcwxP
         sByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781751130; x=1782355930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNhazWWKRcLlrWnSm3UA/eAJwz8pGaK0KJHTqjj4RSA=;
        b=Y7sF8UGwtC9CodDT4gFpYdZfvJTGUpwJxJwmi9Bx7ueO/FgzRaBCXYBFFZ6QffL4Fd
         H4wX/gdkPhgjj0MjFb4rjwQbunjgu2kchkGknHLmKeOb3nlnA0UBONjJcAS0SJ7DvTdC
         R2vXJYVp5r6zNt4u2m9YWRWXi3zNf2tu272wBek5rGFZAShEW7YHj1TBwxwPDCYesIw6
         /j7j9Dzn/o7FRdGtEv3kOqaUxle62MAO050yDu5imZjqoaM5tRHxt240BOLGPSzcCR5t
         7qE0OLuOxjobE9eZ9pjg9lX7p4jkrzG3IFeTLGn30u3m4hbT8+qKJTwZuAKx7QohlzOD
         xbiA==
X-Forwarded-Encrypted: i=1; AFNElJ8Id37z9shkF+cBFYFGUnaZv5TBSzw1JRznFp1Yt6DuDtW+Lcxk9Z7hjxq3q6CnmVpl2F5uWVT44/oXEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweY2l3nOt470c8aQa3DHULlt74DJm5o11mTqGTPFVBaFKvz9MC
	5so0z++82u4CM7WYdvZAkhnnycvqaRqXydaWmj/Tet5LWU9+pP1jLaWa
X-Gm-Gg: AfdE7cmphmQJ2y40pxm6VUxcZwlEVVaPZqG2fniGuyP6t1CNE6cJ4c9SRhvpNKk5Me/
	mYtB2BY7WTmMSEOqv2pi6Cxeos+F4Z/7IGbXE3rf4fD/3I3+ulxXhBJ0z+n9un5VFhPf7QQFk0f
	jDWcCfnOApX5Z4HPsXXtVh+hC7JfZtz3O2K6xY4+UtFYagSZFovEgRhcfoHrrbdtKHdYytZf/jk
	1fJwmDyfXjz7rcNOcjOjxBq7c4J8bVOh45J6NdMSEs8Mw/AeW565eTQFoiQLEaKKPkpauQDN6Je
	ovhv39bxbGYMf8s78LzK1Ge0RiSGkx063aQVTczSRv/ZIM2tWup56ojV+nXhY9jkOAfxVjOr/QR
	GMVHpD2DPfuxGuYQK8U+/yMBZaqJox0awb4GToWp2MRi5WXN2sQC1hc3AD1Ng5pDlblbQ2wSmGk
	iJQmHd1qxaGGAiNGnOiYWyo7zecbcNKjorkwaM62ud4uVI24lQsj1boXIcaVUlbLxEspQuc3OOy
	VFCHBMmAty+Ona3dt/mHG6fBWPVjOLS
X-Received: by 2002:a0c:e093:0:b0:8dc:ad48:70a7 with SMTP id 6a1803df08f44-8dcad48711emr49594856d6.26.1781751129711;
        Wed, 17 Jun 2026 19:52:09 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8dc7f9b4b3fsm25333386d6.31.2026.06.17.19.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:52:09 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: qcom: reject stream disable with no active interface
Date: Wed, 17 Jun 2026 22:51:25 -0400
Message-ID: <20260618025126.1862954-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618025126.1862954-1-michael.bommarito@gmail.com>
References: <20260618025126.1862954-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

handle_uaudio_stream_req() resolves an interface index with
info_idx_from_ifnum(), which returns -EINVAL when no interface matches.
The enable branch and the response: cleanup label both guard against a
negative index, but the disable branch does not: it forms
info = &uadev[pcm_card_num].info[info_idx] and dereferences it.

uadev[].info is a pointer allocated only when a stream is first enabled,
so a negative info_idx on the disable path is unsafe in two ways:

 - If the card was never enabled, .info is NULL and &info[-EINVAL] is a
   wild pointer; reading info->data_ep_pipe faults (kernel oops).

 - If the card was enabled at least once (.info allocated) and the
   disable names an interface that does not match, &info[-EINVAL] points
   before the allocation; info->data_ep_pipe / info->sync_ep_pipe are an
   out-of-bounds slab read and, when non-zero, an out-of-bounds 4-byte
   write (both pipe fields are cleared to 0). That is memory corruption,
   not just a NULL dereference.

The request is reachable from unprivileged local userspace over
AF_QIPCRTR. Reject a disable request with no resolved interface, matching
the guard the enable path already has.

Fixes: 326bbc348298a ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Not reproduced: static analysis against current mainline only (no Qualcomm
hardware; CONFIG_SND_USB_AUDIO_QMI does not build on x86). The enable
branch and the response: cleanup label already guard info_idx; this adds
the same guard to the disable branch. Please confirm on a Qualcomm build
whether a disable request can reach this branch with info_idx < 0, and
whether the out-of-bounds write in the .info-allocated case is reachable.

 sound/usb/qcom/qc_audio_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a3f90cc7c6cad..852a91e4b8686 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1640,6 +1640,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 			subs->opened = 0;
 		}
 	} else {
+		if (info_idx < 0) {
+			ret = -EINVAL;
+			goto response;
+		}
+
 		info = &uadev[pcm_card_num].info[info_idx];
 		if (info->data_ep_pipe) {
 			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
-- 
2.53.0

