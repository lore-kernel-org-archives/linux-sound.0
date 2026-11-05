Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845913;
	b=tQuaG0wj4GZbD8qVUO/EfL0nlPlJmaUnQ5Eco03LNeyCGPvOodVIxOVeFoWsPZdS6RnV
	 LQld2I0nCUSQm+LsgDcit5me9LkU8NCaxeDEwF/pDHXTDWjwxD49+cJ4bWF/H59z5SyDD
	 WxBEj+vyd5yFsOwAWEsmq2sXL3aC2cRSM2KP9RRKAAr5+7j0jRagMXH2kX/7z2DoAnoc1
	 g05Behg/dRzlpQPkeUEDSbkeuZylw1/U61HLuSCuGILIACOU0LBVex57PpVTReEk7u8uV
	 9V/kzkE3EJ31a/6cJwLHWP7fHggBD3ZxuZrf+WQ8x61q1JTu66fyiScv4WgP0tJ3cnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
	b=f7636ropUvn1EIXSyB2ascPP3xosBW/143yzrULxTev3UO0HwYPWV2ODnVBjVZKPlbRl
	 SNA/rdd2FLEnIxT1cybjRAGAT5cLBVDKEpHhvkdXj8NWx44ctZkSKMf6p4Yf8E3CjqI3y
	 x65aL+Hz0eCMgRz9azgg7fdocx7vSPzbemC3CgSW02+P9h5feaZB9zJj1VquoG7eNA5Ao
	 5MEdvNX9zUtYleh2HD2KYXe5NvzNILSpQIW4NVKPL7fd88GlPZdMq0x4zkRayhIu71a6k
	 PpUqHpuM9WjrbrMeNXq8iabP9+nEerflv5VkTtXG6r/pqTZ8fQ/jqIHL03nb0raRWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1uRJF8n;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0D9606A328
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 02:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A0D9606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1uRJF8n
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so84460a12.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 18:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845908; x=1794450708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
        b=W1uRJF8nLsskKCC9Sg/ntZF545260DD8MqgSCGv/bc4dH6kHep9TC5ZoVTnihtDSyc
         yGYFawblVARJ6stVtvmdK7xMb52AIUOSnSwN115Ay7gzKjUysbPso+qukQn2SCvOJE2J
         hpz23KBOpPLJyWnd59iZiOt8cDluB2V5GUtPp9+lAf5RnlrV6bpry4y/tavhIQ8r53KH
         h8JQpmDZVES8wGp3vYavgdvkEppfgsBIAp/so5+qcjBLbkClu7cnJlwXG5+0bVXb77lc
         9AHa2IIKtGDEg/r1FjS3xl5SvDWReHc6ZhVozA9ymbcxWqG1sQh1DMYU8OrAHXP+rsw3
         VCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845908; x=1794450708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBLE+9+yWyusDlKB+5tR9LXP9RfzUs5nseTcOEGR6aA=;
        b=a6I0xIO4IeC4yZWodyHZtcca+ahyhJ/teKJz/9eACdUcaCrr+4ORQP3fte00C0cU9v
         cwReehIz5PR3v8MwCjXP2Vc3YTCA+fqgXazt2ctFAny5x4aIunfQSSj21PyRtHydDUW8
         6+HktO2EH3l0hD+4c8wl6/b1Fsffaczs9BdzNGHDRwB7sdph1yEN1WVL5tOMWM/TO5k7
         bdva3UntSoh57mDiQ292eJfWQ6Epuc+QbG1cVQDfXTLgsjCDC8UwJeoAHVF95bgicXsE
         9XAxLupg7Rxu7uAyMIRnq4uvtPqkUfylT7Tjh4rcYWp8fYg6IjjnlAD7DD0Im2YpV7pU
         /Zvw==
X-Gm-Message-State: APuU4Z+wP+64rw2FDXp+Ox2Ugqhp0WijFM2QJ+0aWu+R9AAEbH6EyD0I
	uaeDQmOKYUQEZljW+YQmlY6Kravvz7MQvBlHZSk+CDQQzUq1K83V9Y/vxMLvvw==
X-Gm-Gg: AYBFou2/St9o+RUiDboLOT68ZODIf9qhiOFW2NMmXD8haEDlZLUCG2d1OzGFGkdBZbh
	Ar6DQev98XVi9VmxZiS/ea8f4fZ+R9HjRloyPNrH9USr9ZDPbffA9HZhHQXiDajSBuGNmUg9laM
	mK1auNJ2bYzthhvVYQDmYxpOfNXeFATEUyZXoKGk+dCJDC09pGaGoCmCWIMvtBaDHx9xHbUvfLg
	lY6tDEyB6F7UDZWxLOUlp8RX/VqkveTreUfMXQvgv/DGpfHRAQv6qvKgSmwI8hXxDUAPmSBbTaQ
	B1/SfnhaS3OGU158S/ZIqfeMdmDlg5bu9Nei88UJRLjIOEGZeGxURjMrnFcWBZaeOCKIUvhYGnI
	EoLtqsuYZBJfsQfSzpbXYTnzmsFDLMbZOnk7S3EgNmOcWp4KY0KthkAvrF1Nlk0+cEhFCaY1VmE
	ZPCFuUZNJyVt3JxU7lcfLKEJpNOTbhfp178RKPutmEM1ikyzIBJ7PuHVyXPXwZc/1Lpnc+8yuyD
	PadXf2KhyZM9VZCxXT9I5+q++J2X9v2fxF/V+zwkQFtG2+UkbSKAkqKnDfYVP4qNvHm6tFVoLn+
	yXydr/Cf29wD2dEr2ERLsnFQ6hnNAy2w59mZurXjrLMF7RLJmBxLLvh61kPK0a3u4ZbOtemd6D7
	fjlWSRUk1Xar90G+bVrggkjd0eCEZGn/Rl28i5MAxTfXzuuM=
X-Received: by 2002:a17:90b:1c08:b0:3b0:9409:6970 with SMTP id 98e67ed59e1d1-3b0afe01674mr954771a91.26.1793845907457;
        Wed, 04 Nov 2026 18:31:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:46 -0800 (PST)
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
Subject: [PATCH v16 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Thu,  5 Nov 2026 11:31:28 +0900
Message-ID: <20261105023140.18373-1-mynameisjune111@gmail.com>
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
Content-Transfer-Encoding: 8bit

Hi Takashi,

This revision addresses the two Sashiko findings on v15. The series keeps
its twelve-patch layout and the same base, a4311e9447bbb219044db38897f95be112f46a8a.

In patch 7, ordinary capture completions must match the next physical
ring slice before advancing the pointer. An empty STOP response retires
ownership without advancing it. A gap or out-of-order full completion
reports XRUN, and later completions only retire ownership. This path does
not reorder completions. Valid prefixes, empty tails and ring wrap remain
supported.

In patch 10, staged pointer and ACK callbacks require a prepared capture
epoch. DRAINING alone no longer permits access after RELEASE. The explicit
PAUSED/RELEASED pause-restart case remains supported.

I reproduced both problems and checked the fixes under ARM64 QEMU with
KASAN and lockdep. The completion tests cover seven cases at patch 7 and
the final stage, using real returned descriptors with test-only ordering
and status injection. The ACK test uses raw userspace SYNC_PTR calls in
the post-sync_stop window and after an injected prepare cancellation.
The pointer callback check is synthetic: ALSA HWSYNC skips that callback
for capture DRAINING. Prepared drain tails and paused/released access
still pass.

The six changed stages build with W=1. Stages 1-6 are unchanged from v15.
The combined build also passed 70-second RW and MMAP capture, RESET and
reopen tests in ordinary and staged modes. All fourteen captured segments
matched the QEMU sequence oracle. A separate v15 comparison confirmed
that staged paused RESET already discarded the old partial tail; this
revision makes no new claim about preserving that tail.

These runs did not exercise physical VZ devices, NOMMU or KCSAN. The new
reproduction fixtures are local and have not been uploaded yet.

Previous version:
https://lore.kernel.org/linux-sound/20261105000915.15177-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
