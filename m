Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981929;
	b=mbt3DjdUJzpib2JPYe86x2EX9u318xPF93kdlGrIl+DRwvvfzkH3kw9W8POHEcuUFNko
	 qlJSi0iwgYFVP8kBtHNJH6Y/tKnvinrh39FsRs3IsEvFP1h6h+w42085W5YFlGbinvdiK
	 6kGwKOcSWa+lRGaheOc9iYe9fb/IHJPT/ZOE8eaLXwv0rl9UKCpHD2Hs8ZvN6oG8ZCQTZ
	 nUuvsk9V60iPs85ZfxV2dD2Cx13svtoMNkYqnYxlYdjY9s5hmHEBXtmBjwxAGegR0I9BG
	 v+li3sLXicCbgNEFVJIEMCdb8D9Q90sV0A/n7t42UwiaFJbfTqA/j/B3c3vrczFFBZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
	b=YhSIVesOwUcRJi83GMdURiy3UpKZXTKQSdtZgc8Ve8S1XYqTY3a0mVBM+4/PtHKn5Oyr
	 gyHeJVSE7y3I7m4OCX+D+Qigy8Q326q9pvQL1YClb+viAZ3XvcaT4sx+cCe3YCZVB76bN
	 RE6mb404KhH0Yuc9VqJ7AoNRq0KSzDJDHs4Hry6jGPXbo94PpYq4Xdp7meXEdenyGmFvS
	 CxyutiADTD4F5sBcJSOTSBoazeXujI2Hj5oKOBnw1koILK3wR8eYJ7cJA3/ATMpXL/vSC
	 xvvdLhTdF9gAYABW8Akj9cGSKmjtxToZ/ISyrWIQlkOxK6U/u1jl3ZlEW1fWaDIfJrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3AD606A32D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3AD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so1671099c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981924; x=1794586724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
        b=ive7ZrhAjBWK7ZFfpfPxCUr9GCcskXBiex8vEbprHuYtZGY3J1jvX0EgfR/Nj5BVPT
         XbfIPrSeTCqXV/6JB+aT+7L+xoWEdTofOoqcf/5pTelGmMpqEcV1pp91fYrGUsxxLMAj
         OG0IAR4SwtMEWrzzVV2IbyLrKAGPJ1acAha22WojRJYAOWrVM8ihptmf0/9whUS9ijrP
         XXE3Pa95QQ4ZQM1q8Y0daOtOEN8coryhE+QILNrSFctNxmeHRj3RbZOVNNyu76bquiWU
         w19gBEG2jiQaD+94fDqoB5L0ZMTFbDyrBQw0ku6d9Hd3fYrTH0i4iCdyxu+/72FRz+DR
         XhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981924; x=1794586724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
        b=U/Ss/UjlxRr5pDEoBaXXu/e9Aw0lFa+Qm/ksJutsPIzmTx5osPgKYdvJORnacw7M5D
         eo9oURsT3FT4Ihd2VrpNgpPgCo6jNLbE8bo/VMdHucr7J29qee3PqegDOp/RjJwvb8bL
         uL87szgHiKXY3h2hoFH3OxvFli2yKlhqCL9F9L1F6n6bjNqun3+YXLGpLxemn1rGFoVs
         ABY52/HyluX6s5VhNkJXqg9c4sRJotUno8tLnighZ83zHuGadYBXe9N844G7P0PRHH8z
         RU1hvo+gcjsNof8t2YyG/jUFyPQOzKXJu4wjWIfviMNUpOGAkkuvm7Ii82D0qbuWHGiS
         aFTg==
X-Gm-Message-State: APuU4Z/n3KYDaHXXMJ8OEZjUDKhrAo92UZPsf3TVsxttR5+rmgmBGNN6
	kNAbuHf5jSSb02HlIfS4AA4SOF9hb4zSx9m+WRpm5dwk50KolEGo73eRH6uWfAFu
X-Gm-Gg: AYBFou01cNYMmyEcSCcS9WGTHg9hvAg766w1Kai62hdUuFfFVXpoWLVnKrT9meQdZXH
	sm/WBa31i9F9vV1wAKLu3tSWyDi0G9q/2eHSre2a9Cbq4oMsqDj/8++h+STznk6RDLiHmrDlsPm
	I1r3MVQwp2Yucmt+y/MKa6j2ik6JmoNZvnLQXRC4/ra74g6kccygUkKb5UzF/hiK+dcC9w6ioBj
	P6xYIaGVHkxIrzpXS+RUEWR6+YcSi6ocih6KyhFlKBccj0Ws+AFm/u0roj48EQdxWHq7Xx+BlCK
	cPMMtI+JdWu27c/APtDuvLrLYJmF6mUGAacNNjBqs7KzCYLPkd4mVInvYoiQbN6GgqBhgf0Al/s
	X96nhVJK8D1V0JyO6w/yuGj2HezDo9kapqiqz1XFMNw0Gkd2/DxcXDfoLhAT9GPX6BHTbOiMRCx
	KYk87MRAjJWuH7hQI4FyPa/SblHCWE3LvufGNqKW/oA6zNgTbjA9ER2FR4HAsuOT4ce8Zfn7Ud8
	cxvFVk/p/5v6MO7856nYVopDWEHuMtzNDA5XZpnbUH1DhrnutzcOudM4eNWL+QrqDGzLAbilumV
	sgu4mdx0IQ7wVsfmAdGNA4f8Cesgbf+a/nR/wWjZOUVx8TJ1DLbcswkNPvdSrFKKfVLTlNSp0Tt
	cHP0xSmnFNsckTNBJ5PO0k0YAisnHN9Erd/ZxkqnSfqQ/wg==
X-Received: by 2002:a05:701b:4588:20b0:17d:7b45:f927 with SMTP id a92af1059eb24-1b25d3499d6mr3671255c88.33.1793981923536;
        Fri, 06 Nov 2026 08:18:43 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:42 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v19 00/12] ALSA: virtio: fix capture accounting
Date: Sat,  7 Nov 2026 01:18:26 +0900
Message-ID: <20261106161838.94308-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

Relative to v18, patch 7 validates ordinary indirect capture appl_ptr
accounting before calling the indirect transfer helper. It bounds ACK
consumption by completed, unread capture bytes and rejects positive
advances before RX ring seeding. Active over-budget advances follow the
existing XRUN path; invalid PAUSED advances roll back without ending
PAUSED.

Validation:

- Cumulative ARM64 stages 04–12 passed W=1 builds with KASAN, lockdep,
  and OSS PCM enabled. Stage 04 built Image and modules; stages 05–12
  rebuilt modules incrementally.
- A bounded candidate-only raw SYNC_PTR audit rejected unseeded PREPARED
  and over-budget RUNNING advances before indirect accounting. The PCM
  pointer rolled back, and prepare/start/read recovery passed. Valid
  partial ACKs also passed. No vulnerable baseline sequence was rerun.
- Candidate state runs passed valid subperiod ACKs, PAUSED rollback and
  resume, DRAINING tail consumption and over-budget rollback, and raw ACK
  before and after PAUSED RESET.
- A slow-reader QEMU run kept the unread capture slot unchanged while
  appl_ptr was held, then recycled it once after one period was consumed.
- Four final-byte no-hook QEMU runs covered ordinary and staged capture
  through RW and MMAP, including reset and reopen. The 14-sample oracle
  passed across ring wrap with no KASAN or lockdep diagnostics.
- v18 MMIO rollback, timeout-width, and PCI remove/reprobe checks are
  inherited for the unchanged transport and control-message paths.

The bounded ownership trace did not reproduce an in-flight duplicate
virtqueue add or message-length overflow; neither is claimed as reproduced.
Numeric ALSA runtime->boundary wrap, physical Virtualization.framework
devices, and KCSAN were not tested.

Previous version:
https://lore.kernel.org/r/20261106000644.20460-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
