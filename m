Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458122;
	b=jjuM/+6cd4KPP7k6REA5F7oU+3heoKp+CF1a1Z6NsiyvxFlviELPCA43l5uDV7HLJNwr
	 bdzo0h8dOCVld3WH3Nmn9b3SEW43V4X5rP9PQk/V7XGL2cSeUfdhnlIMjWRjIjUeDZtlZ
	 BcrWrMcfLctHy0SSYlzd19fa5PvANsAA+H2rEHAGMQ9o1j14zLKPQ9u4p35gyapeEngXk
	 /ouBDkfIMSbxop8VKQbdfEu+NZC245VY5jAORb0KSppE2eq+xZdpBW+70hdinTqYGpPZW
	 nY8GaUjJPPPohhezLPBurXerVeO+Ra4L7d++sLhipMCLM+QuD7xJ7xeQgZ9y61AE9RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
	b=kpKdYaZPgTWV3GjLyE/YR3jpxZX37KpZV8wcMJnIqkW6d5KcoGzKAs0aVgBQW0W692u9
	 axjvLJtVIpven0Xzlv+Ss1NevdUwU2Bwu/TlInZwXmxn8zs5zEX6aaOCU0HZArA2cOLLd
	 cuOnfOs5eIB75qEHEmr8Mp8YYVKuxbZEExnSPaC1QVmOiFQdjelq//FNTY/HCttd9+8in
	 /7kkZYsBJkSsJRW1+aZzLcaXsRU3duTzK/C2DyBp8eTEtJB2mH2jUjYkOfMVpqdX5RNdd
	 S1D6tukWM5v89fZo/HrZzWEzP5Z1rPWVfjjU/GiOO8HnkWAxdoqEvlzkPzz8+mis6Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qexJCdgr;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC80606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC80606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qexJCdgr
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2897343a91.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458122; x=1795062922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
        b=qexJCdgrKqu7iz6QsNmvZZTlpEDaXePtg3UP9eDE4jqQDKJ3v7quaTmb6YAw+YgFoF
         meo/8gibEag/NyGmmTi9D1gu/k6Tcq8Uj/TusOsLsOoY7mY2jvCLdDRMDejmpyEWgGyo
         WlEEgAHuBg2VzidkHQ5nxYdARDKkDx3bmad6I1yMJtgFOB4VDCNqkmAqfxNghH1/hQLP
         r24yjCiiGctQTFBsc4BLHyEmf1Z7iyatcBhzVpcCVxfbu8WYodEm/MXCLc9yOLlvlg9e
         QsMV+h20SGwWWbon6Oq/ZuvUJBQjqW27lebZ51vLDu5etYNzPuJQtqNjPcw4zeyBP1mM
         7PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458122; x=1795062922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
        b=bzaP0Zu8oYCpc8nyOG6b4g6d3HP6p8cmyIwSydKtKn14wAwA3gmnFVoGgGErWf4Epo
         MwIW1g3rUoEI7UK6+kwkXz3oD9n83bCuNE4pWau2Jf+pArJgXecRvc79FBsYns6sJx0n
         w+A7sI1iWCmqxdwDZAMab1m9EY/3X8bTRrOyu4L3msD4OPYZ1LxxSM6iGNMmMuTeV7K6
         TDP6T0eWEGRPwo5vtwJHS0hpxPglbLz+Dn3p64dZlqWg83y2rr1T/dJPDh2QtHtdhZPE
         e3S5v/Rx3aItI/dkVEbebEdMeHuCl09enaw4ycgYRkjTLeVambg01qIy2Z4wtslR1Du3
         uWOg==
X-Gm-Message-State: APuU4Z+l8au4hhT1EXGYsvgJud4lZtzaYBL3Va0zOFfb326org3cJo13
	LVkj5Mhk45O0xAQGJDNcBawKbz+fhfVPaztsLF05m8279xbWDYvKhg/QZu28sg==
X-Gm-Gg: AYBFou0F/h7Ws8PytMO/pTdcf9DQIKLNoaDl1JIkItjWhd6kcpzPpQIMmjRulkQQqtX
	vR7dI/ley2Ib+sQrwGoHodbNMR6X81vSLkTZPjRVae9HPkZl91YbnU41CjHUaR22ZCS/VghTF+7
	bAduLe5Z6XwHyXiV6jrDquh7NZS6ioCNwwC2HE38iUqWlFGIcwmIp1/z1W8OB9yAIDxisW9mG7M
	yENfVI9bC1Q5I9Hx1mZRkf37fW30EQlMPlvZZ7CfZEsP7fObphc8RwPSuaOKN3ra48KUfHhXRIf
	lZWvH6msVucfUnXk5nNoJc4AkKpMJT6rWIaLGZzk4GshOUSeNrAQwAH5cw38b7euw1CIXzJ7lXs
	ZDl/S3Rc7G5OspH52CK+Y89Lv1Xc3rvdXQS5ms4OLWAucVGxO6ffp0sM7l+p1d6LIKb7k1TuTBl
	lDJzWjToqttvsXkvKtCQ/DZe7wkxx0mfTidfChxsgBoJebwTk4fwWk4TnfHDlTM6a3P7T5E0S9b
	SCX2zLoyx3uVFiZQ55inJgz7jOg/3Ok3BdJSBFix9zWbUtH6vq3pjUtt4M0cQW5Z/I4C8WMBbb7
	yTSpn0nu8PggY2u/Wn1GP6ZfCNP/sPKudE0owENRtHJnKYdghP3GOJ+F/FX0O5U0oGktxQnNERj
	GY3C9kpS7W3OtDvKFewZ4QGKG0YA1wjfSxrCC7DPLOwgINls=
X-Received: by 2002:a17:90b:510a:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b182efaa1emr4409006a91.37.1794458121795;
        Wed, 11 Nov 2026 20:35:21 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:21 -0800 (PST)
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
Subject: [PATCH v28 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 13:34:59 +0900
Message-ID: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

This replaces v27 in full. Apply all seventeen patches directly to base
commit a4311e9447bbb219044db38897f95be112f46a8a. The previous public
version is at:

https://lore.kernel.org/linux-sound/20261112004704.49758-1-mynameisjune111@gmail.com/T/

Changes since v27 are confined to patch 12. The other patch diffs are
unchanged.

I reproduced both capture findings from the Sashiko review. If request
N+1 completed before N, RESET could leave N+1's already completed
payload eligible for later delivery. After an external XRUN, rejecting N
also left N+1 buffered until generation cleanup. PREPARE cleared that
state in the control test, so this does not establish a permanent
recovery failure.

RESET now marks valid completed payloads present at the pointer
observation as discarded while retaining their ordered placeholders.
This lets the commit sequence advance when older requests return.
Transport-owned requests and data arriving after the observation remain
eligible to commit. Repeated RESET preserves the discard, and invalid
response status still reports XRUN. Rejected completions also release
returned buffered entries without resetting the sequence of requests
still owned by the transport.

The failed native PAUSE path previously reopened the queue with the STOP
quiet boundary and capture_stopping flag still set. A running stream
could then accept an empty completion without the normal XRUN check.
Rollback now restores the prior flags under the substream lock and
checks the reset epoch before reopening admission.

ARM64 QEMU tests use the actual driver functions with test-only request
ordering and STOP allocation-failure injection. The v27 baseline fails
eight affected assertions; the candidate passes all thirteen assertions,
including normal reordering, post-observation delivery, invalid status,
and STOP empty-tail controls. The running-observation test invokes the
actual pointer-observation helper. Full RUNNING RESET ioctls are covered
separately by the production regression.

The production driver module was built separately without those hooks.
Its ARM64 W=1 build and eight QEMU regression runs passed with the
matching v27 KASAN/lockdep kernel and core modules. These cover RW/MMAP
capture, PREPARED RESET with DRAIN/reopen, RUNNING RESET, and playback
PAUSE/RELEASE, HWSYNC/poll, DROP and reopen. Capture includes 70-second
RW and resumed MMAP phases. The independent backend-sequence oracle
matched 7,104,000 frames across seven capture phases. No KASAN or
lockdep diagnostic appeared.

The kernel image and core were reused unchanged; the modified driver was
rebuilt. Fresh KCSAN and physical VZ tests were not run for this
revision. The earlier v27 KCSAN and Scarlett results describe that
earlier build. The controlled tests use synthetic requests and a known
STOP failure before submission; they do not qualify transport
timeout/uncertainty or demonstrate out-of-order completions on physical
hardware. Intermediate patch stages are application-checked; the fresh
runtime tests cover the final candidate.

Review addressed:

https://lore.kernel.org/linux-sound/sashiko-outbox-210240@kernel.org/

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
