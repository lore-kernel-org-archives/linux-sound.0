Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809158;
	b=26+JqFq0OlId20/LZpSLamU4q3VuRSRHjKZRq8rZXl9EsLhh/pULGQKMKiWkF0Q2B3Sx
	 ZGGGM29BL+239/PLPfS8gwczt7U2grtDyc6Q4S4q/kfFydexLZg205AwnnCkfHsJRPsAp
	 qOm/dwkQvwrgooyU9ZTYF9fdo3HLIm6OCAv1Tbv4dwCGqW5B72LeH5yf1ELoETWkfiYcA
	 JfSXolMGvEPj6Av9V/KLWmhLdFlqywf5VbgV5lkBvAFpdtZEMxe0WLu9J9Zfz73dSsBBY
	 1WuMAWGe+JHxXZQx3X2rXVBFI0dh6RybgIPbYIf6MxGC6M8pTAd7VcNVIS2LaHaF+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=51kv8COGqzMvJBRd7xyPk05iBH4eNFHrYUZxKFt+cc8=;
	b=0jrd6xm7PG0phw87dBDJRlVbVkERsaIQXyva9wj2ANhS4HiIIGQOuS1+l8mU+NBZgDV9
	 oX6hKAtWPCBcvzGMqD/rVcARAMZkW42BFF+ZXUvTR4LipH0bdDFJvFXQMB2N4qebgKyjH
	 9ndfE17oAKnP5etAKZOm3T8Gsv9/p/ekLhhbm5UtqJhxl7/IpqHx5fgR17z1iaOBPoKcE
	 E7jcsr1DMcAp0bQDWHSeYoWYviajYEZzhh67V73Rvy1OwhPNxI+e1UkjawP9ulsjzPxh2
	 gZDCu07yZiqttB10YRS0zmMwLbhDrW3MGLSDS4zrPuJ5JqIIbvzI58UmjX5rafTwQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QxMhaEBh;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB704606A31D
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 02:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB704606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QxMhaEBh
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36681e85e87so3598860eec.1
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 19:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809157; x=1793413957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=51kv8COGqzMvJBRd7xyPk05iBH4eNFHrYUZxKFt+cc8=;
        b=QxMhaEBhfikMWCAWpnR0tc8eZVZsmkz2ClyByy/KQ2Mt4Hd8Zn+H28qQlA+8AfjxjA
         99L/hYPHQd9R/GERaD3YaE0kszRWNTPllTNCXf/B628fueTioZo13itc08kjgqI5D1bv
         0QGPglTd7kC6WUTYLnaIGrdxrp7pl05kHmJ0JWcVpOBEIu1Vxtw0ZU0FdxcWR9jRRCjZ
         208yIJEAx3H/CCofw4d45xo8i4+aIM4FGj+24cPPYxe1zBZoNnsSvOtdscx250OKuT+k
         BH3dT1CW2qwE4isnGCBolIbMZzAATvj4hfwD+eZQBh26hH+I/Gjf/9udq2YxYFzSGSeY
         f/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809157; x=1793413957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=51kv8COGqzMvJBRd7xyPk05iBH4eNFHrYUZxKFt+cc8=;
        b=0aUo4inYdPGDjgP1qCMY6JzFOAlkkuqnrbhuxDWPhZWcH00cjdkdJv4cqzExeU8d5m
         6PXIswWGyQ46D1Hxhl4+cw0mFL55gaA0ZDjv1igxsgQpWwAMAE84xXry2droDrgwLQta
         3CUWYL+Gzw6w1PvetDqFsujj+a18kACfuZBC34WblPd7UF3Z9zcnAwLCJRfJSzaolnVg
         FwtFSAL3s5/SayY2Edr0YVwyGgW2jkIxOpolBsmklBt1bOMBBAYJ3yVripvPzk1mnQ2y
         Nw9YbfHPaCdfQmubygcMpj/TLXSm1v7TSRTT0Pxdma0apCZHEC8yXbs7jMrDL5evgQf0
         PGFQ==
X-Gm-Message-State: AFq9FYJ1loitJsJ0zMU8x+8kLu9XXTYPydG1rEpn0SfRK7h9BY8MWmcW
	nE+eaLc63jl6kXIwkwPbaZnSUb62nz3qFKfaBr1ejhRLZ0G765dBdUJncP0g9HFh
X-Gm-Gg: AYBFou1VDVR/IUlVJU7tEJKbWDuLdkif2ivdglf7YGIdjp9ye6uqdt0fuNn3CWNSay8
	6HtWF2BaVA2+aLfUYGOt79iL24fs7xe13nIAxC90DmlfM4O4E1VpP2JYJUU7X+v7Wlo7Q6ZYEHk
	ppfFwI8FO9Ii0ZW36yz+COFGsZCL8wuWEwWuc5V+h1t85M+VMRsORPFRyppcx0190bzGuYAas42
	9+bF+KtfTGFIZxXoC+OLvlPT3kr1MtuRS3IYOxmCKSOHqufrwZeA1YaL34FXvKzGa4ewh+u/QRr
	zodspAvH+glwSZ3ZCFyjjPfHwDjNEsGjMTsn3kxloqLyeD21VVTSbW/auyBTrXQFDI0vbWS2m8o
	l/KzQ24mbtlH2ypkO+jOvkNQkQocWhOsO6g1oSeIe9Xmmw0/feLaCKsqWf/XRGkBKATEYU3M4fA
	8b4IwSYMS/6uBBXded/D7XtKBxGBPPkZGz9zuNWH67G1SP8pC6L7XSgn3wIe8K1EW+PG/wNXnjt
	t6H7WkWEIBmn+F8AENOP67gZinO1AQXK32rl6h7oPVK/hPkMTxpMLM5sTqzag8xnJKa+vPVTUSG
	D9fQZ/kjTy292xyn6IgWj/15S/kU//zhj36xzvi/zxg7tyPWgD4ZFqkiaiGZ9zUHNvEzkFst
X-Received: by 2002:a05:693c:810c:b0:367:16cf:4a8d with SMTP id 5a478bee46e88-369e84dcef0mr1536459eec.35.1792809156653;
        Fri, 23 Oct 2026 19:32:36 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm3958542eec.23.2026.10.23.19.32.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 19:32:35 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ALSA: virtio-snd: fix dsnoop capture with staged buffers
Date: Sat, 24 Oct 2026 11:32:30 +0900
Message-ID: <20261024023232.84448-1-mynameisjune111@gmail.com>
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

Hi,

This series fixes dsnoop capture on top of the staged-capture virtio-snd
changes. dsnoop configures its slave with stop_threshold == boundary and
can keep capture running without advancing the slave application pointer as
an ordinary reader would. The staged-capture accounting currently exhausts
its bounded unread capacity in this configuration.

The first patch marks stop_threshold accesses used by the driver's policy
sampling. READ_ONCE/WRITE_ONCE provide single-access annotations; the
virtio-snd state transitions remain protected by the substream lock.

The second patch caches the prepared boundary and samples the stop policy
under that lock. A completion uses one sampled policy for validation,
copying and queue refill. Free-running capture keeps requests queued and
retains the existing frame, payload and pointer-window checks. Returning to
bounded capture restores unread accounting from the monotonic counters. If
the outstanding data already fills the ring, the policy helper returns
-EPIPE without changing the cached mode or counters. The detecting RX,
pointer or ACK path then reports XRUN through its existing error path.
This does not guarantee a synchronous error from the sw_params ioctl.

The ACK accounting and subsequent queue refill each sample the policy under
the appropriate locks. Prepare and teardown reset the cached state. The
existing ACK-race and priority changes are prerequisites to this series and
are excluded from these two diffs.

Testing:

* ARM64 QEMU synthetic dsnoop capture: 12 files and 2,160,000 frames
  matched the reference sequence from each client's observed starting
  position. All 48 corruption, loss, duplication and reordering controls
  were detected.
* Default KCSAN: 13/13 cases and 619 policy transitions passed without
  race or lockdep reports. Forced RX/ACK policy changes and four isolated
  policy-helper branches passed under KASAN and KCSAN.
* macOS VZ with MOTU UltraLite-mk5 at 48 kHz: comparisons used one or two
  vCPUs and idle or CPU-saturated guests. The baseline failed all 32
  shared-client captures. The candidate passed 48 captures and eight
  recovery diagnostics, including mixed-rate sharing, client departure,
  reopening and recovery after an intentionally delayed reader.
  Loaded shared captures ran for 70 seconds. All eight accepted VM runs
  shut down on the first request.

The physical tests checked frame counts and nonzero input. Exact sample
continuity was checked with the QEMU synthetic source. VZ exposed mono;
these tests do not establish physical input-channel routing or multichannel
support. Aggressive KCSAN still produced dsnoop client-threshold XRUNs with
a 160 ms buffer. Further isolation supports a deadline sensitivity, but
does not exclude every kernel timing contribution. Separate generic KCSAN
reports remain recorded in the test evidence.

This series depends on the staged-capture prerequisite stack below. The
tested local base is 8d0d4c1a6c4bcb81ae9f52d1c0d979fafb2e22f2, consisting
of nine prerequisite patches above sound.git commit
5618f6837ef3314e2c581d4c05ec13b7ed975cb4.

Prerequisites, in application order:

1-5. Lifetime and error recovery v3:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
6. Generic teardown/control wait v2:
https://lore.kernel.org/all/rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com/
7. VZ staged capture v2:
https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
8-9. ACK accounting and high-priority period work:
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-1.f2737c95c12e45b4@gmail.com/
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-2.f2737c95c12e45b4@gmail.com/

This fixes the staged-capture accounting introduced by that prerequisite
stack. The reproductions do not establish the same failure in an unmodified
upstream kernel.

The policy uses the existing stop_threshold == boundary convention.
Sampling it under the driver lock avoids introducing a PCM stream lock into
RX completion. A completion overlapping a policy update may finish with the
previous policy; its accounting and refill use that same sample. Rejecting
a transition whose bounded accounting cannot be restored preserves
explicit overflow detection and lets the caller recover the stream.

Patches:
  ALSA: pcm: mark stop-threshold accesses for capture policy sampling
  ALSA: virtio-snd: fix dsnoop capture with staged buffers

Thanks,
Joonho
