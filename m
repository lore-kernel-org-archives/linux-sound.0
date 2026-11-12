Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458175;
	b=dljy2tZpVer9EC7DYbQck8MNY0r/IbWct3f8JIf/kjILNSUIy8uj3+BRo1HsBT5Fc4nH
	 d7mNbIkFqPwl6E0iI+uPjmyV3UimpJ2WTuJTyCCAVLXdiFAb/JOvK9c2AvG98a3e+wH8H
	 VsY1zS3Q6MgJeNXlY3n6nlgxAOYYxlRjrIo+W32cXjSylsNYb3NehDsorx78Xb//z/i5V
	 XcMt98dM2FU5rW4N9PADiK38asHmyvAhk9uVWY/ujWq8ii8O7a2pn8FHjjnYlOrgCSBqu
	 Iv1s+vvVkMxQP0162FL+LNhJXBOHT17qOkeTRxoAzZ8uw8l6Z7/E3CWeqNXB1/qGuvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=uZeb+KJvc+PNmcTWVw15cd6Nt7sFqJUDHkMLgFvpMlYfWqXe5VLhFOB/rA2DNA9YZALu
	 ieu1E84+eoi8V5iTLWbvsoHcayhv1B70WY8aqBXCguMkJABygpDzjOpaApI7tIsSQpxlb
	 fYYTYT6wPw4ObpzABs2k6ZonWSbcak/axH3kidoCsqwmv3K/3CjCmyCxj1tY7VldnIOYO
	 mOcJPuL5zcOXZQExFS6c45gbDjoR2ipieeWfk0NYOyhJOsXQh7g2CHh1uY1pURK7KzOgU
	 EkI9IeWou5Bl5NR+CYErM7nw90gGd8TeKFegsIAAzbjvnjYp4YdNBYRpU+duzTUmY7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7MQGE6;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A860A2603
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2A860A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7MQGE6
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1869902a91.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458174; x=1795062974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=TS7MQGE69+VhsF1sdcynqvEYy24ryABcEOVMNyXXCyOedAYVu5esZPeKOpvPoWPiNp
         SgMxNLtpTwZbYo0q27kvITp/yrdZnxy6+u8FLLGEBN3vVkBN3goJO+9OEwu1HZa0v7Mp
         Jm8y7ZMZoSD5AeBxQ7NN5wetAZKjX1XLvuglEucDZl8vgYaZPO4ISXfA9+D5ioabDHkw
         4G0NttZlPp5SQQnl+21VhB0+oodcMlRUa5Nbco0qMcllJ3fi6T62MewJCGW7WNYCZGAV
         hTpqmskvYcJCRkHFV/CreU/Mf81wTHqUaowXXmR9mbaiuzs/LphcieCBUvMbFEFtYSTp
         FHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458174; x=1795062974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=tRzuO6hRdZ1jXsMno8mgwYcV17sROZQ8churBZlWOfW5iGoK1whWpNzPKaHtrq1mml
         R2yyLvtb4g81OcWF2KueXM7IUL8CPxoPbIRHtc0GcASJwTtUk9tYLhU6DXn8UflnOeI1
         wiEAp9P/ePyxtR0UbV35brK56iXG/1/QsWy70jzK8wejEpXykOVyVmgnsTf2ljO1cVCt
         JT3dowepuFC+tsi42pJ/fIw2nLcZWzVHfvupCAj7qSl3OjEeRKFWwO6dB+s2U/v/YTCa
         tvyAI/OBkj86ueBozJwKhvbbzo7Ez8F2rGGkymjrMSs/H6WdgYjqgmemMwAO/qfzV5XD
         sM2w==
X-Gm-Message-State: APuU4Z/2WYuBASN+iyZgUiutQiPW9f1pjg+jttXZPqNi86iKmMFXs3oj
	BioPjhr2MssedTFQGCXdC714FwxfV2i4ckHo47c7xzsfGokCk4b83pCnzm8emg==
X-Gm-Gg: AYBFou2w/6+yL5gA4pr6VxROCUb/UXwqrXnzDQKQe60t1dnBi1oiV+6rZfi97XRhnP+
	JEdGByUlJ3jL0E6zhEU0cLv0OvNhu/aIhjagWOIVzSWL2AE6PRJuoLp0T+KStYFEidSWaaY/HI/
	j4H+A9+wiCsjDv8KZFpQ7yDab/U0XhDrjVX/2b3OMVFW1N8DX8a+T0STyh/YMGSUHHNm2HqB6Ak
	qtsetbYPdNvwdN8S+XD1pTnY8mJkLSv5hKbjKlvYQWR0OuQkfNitDCmPzdSX1Cnzo4GbE9iO6DP
	N0HZH1rcnd5TrhUAJm+K3hA/fnFr3KQ3obY8YcMo2QbJYLJnJK9rYpbrU+3gH9Z+q6seZvZJvng
	UYSxq/zSkC5BNZLhIRsnodLjDTsWESTK5BGYNe+HwBTCyE3MAe+SueidVL8osuRrkQiphk6ZAGA
	KLqP43d/5CYIq8Wxx7oY97rrolEay37J3TK9ZKMyAOmgN1vvuubXmlr+35p7l4XXa3UHxaVvxGK
	yphWF56Qop7wLUF2QM9BlX8uEqPASx/gT7o3/kWPlISqTJCrlWoc4HRSthM7/9BWtWuAMn/x7mk
	EoRpyXha+bQbqCTlEx588cS6yS9qZbSseQNGNi5pGSPi16YciYPDZmPNueHyegEBUSl3IzhhQUp
	u5OiCiHonojdKIMzBrgNj35sSvo990b8nfsEpdEFYJq+aSsRESPt2XRowj1FqgFJQ7Nyz
X-Received: by 2002:a17:90b:2649:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b182f235c3mr3670927a91.33.1794458173944;
        Wed, 11 Nov 2026 20:36:13 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:13 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v28 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 13:35:14 +0900
Message-ID: <20261112043516.37010-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
