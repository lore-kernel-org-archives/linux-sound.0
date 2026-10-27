Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144622;
	b=bbKCzboy9tOys47lKWueiBoaiv7OLjfXteu4RE/90KWNAqwM7CzWmH9GY01tkZ57xa2T
	 03eqw9FVSFPnvLCjNWui3JJncGklgxqhvYI5BcZdoFRKCvMVlUTVYKXW+iBnHy6m/rOzu
	 Wbc24wFXlxuli7zZ97SGxINUd5ea0HA3yagx9kKClV1yha4ZhZvg/Z92cZ38coNVss4HD
	 Oks0DxiOuWj/La61dP20IFBr2TtT1pMt/CKKxRmnyWKB7iCDhwPvujQMTt5rG8qqwJXjT
	 nQ8Yqeccn0IVipHyXqEpHU71U34UDU14y/bTfhz//Cz+YCd+ik+AY99SPadB9UN8DwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=B4qnDx0k2bpcfJWg33p4lPdO3IoU2oz8ozCUQhYAFVc=;
	b=fCNUDVlZKpL64Zgo2cbRbg0RwP7S2GiUwHkBzx94Ju76rAnsHBvyg19C1b1SsBrxvI7/
	 GCzwKNX4EUiVUg0l/1T/zl2OdKPhlfIzfMtLyfL3fGKECJylHHI0GG1OnghC/nf0VnZnY
	 UcAh9+5bJHULBFEH64Ubi9IvMk4ZWzGNeS+lnyvUKxkUQ0Vuokld+AXqlJw56DvV2xCcs
	 PBAqG18wfHz6msF8CdFs+1ALTtQfDh1S0PW98XQYJilbjaEcMZnc3eLF3tIpio8BKNr0W
	 Yw1XEk5neq9VuemUYGcPpre4c+9JseY8sxMgzzpFdFHMTG93/7SPojd+3+O1nXtL+JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6zmHtmq;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F88606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 23:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F88606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6zmHtmq
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so238642b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 16:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144622; x=1793749422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4qnDx0k2bpcfJWg33p4lPdO3IoU2oz8ozCUQhYAFVc=;
        b=q6zmHtmq2+2xjpS7gExdAApxbJkj+K+cEA0LVg5vkiYpGPCes1JeeGijnyIsqU9VpE
         p22carrUCVNOpsQYBYxl8ihVNDdTBzV6pHTBRaq9AeKO+d7YcQ+5oORhmPbDA2vkAHix
         zJlTcgJo8Q+VSbvE21OVcPYTHsZus9AaYt8pk4zWZ8twC3oqJqjIHRsrJafrUqmHW8NC
         EALiGi0q5ck4EKMH5ecYRF7kT93ouCNgQoJ8BPSogRh7PDIWh9L2Yg6/ymAJFFOapcfV
         +NWXL21YFBgEECJQxkTPJHnudk+yMnqbn218rR6ouTRjJicthHA8+iDJcgAgpAjVR43h
         jqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144622; x=1793749422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4qnDx0k2bpcfJWg33p4lPdO3IoU2oz8ozCUQhYAFVc=;
        b=2h82qgqX3xd3LFQSvnoRV5Tuz3UbLAuDneM1FfW3CINx4yo+0+yypU1rUHND9Tbxi+
         snPpkBkt1a9tlFSN4NAuiDw8JH00LZIesw/9deVZbPpwzFrAGM8D548wQ+JCZNUFmmEk
         9qRrVDOu3KgQXV24bsVxfVE1NCuUcwX5FFA2FybmE2KigMJbOjQRVYiv97ycEeuWe9k+
         JUnOBa2EnSxzolXdNSGnFu2f74wW0jugGjmsNgF97enAMGbeTuy+kfsKrY8kGUZGLPUN
         T2wPMmPr1TFNF455jrute8yLMFA+ulON+CqEw0p2szVA2mpzVZwgNDeNADtv35H44ymS
         CGEQ==
X-Gm-Message-State: AFq9FYJmSw698ZXwxr8DcyEEzhYKZo0nldl7cwn7eHTlKm3FC6zUxtqi
	CyjcWgm3EkghuiHiiusExIkqnz1pDOJmsFejODNjgvexLhS49G9g54ZsRdlJIA==
X-Gm-Gg: AYBFou015JwsJ42WnV9jaJKH3REyts9yJrTwPgnVLeXSjXrQ9/aWA2d39p5oI6AcJwm
	NOHeXp5TToV6wK0xgL2lu51WHTayNkIpKQGLfIUTnSHdxs4ZYhiA0Ge4ma2Pp8WK9i1/48Rqnyk
	qFSphIRe5qt2T5diUgRQxJQWPJvrZBaqwXr4zxkRebc00K7NxaxFsY8XQoqoT1Ldvni+gs/2j+9
	d9wnioUr6b+7lK4KbbqCLzxvBBGRuyM0228bThziOZV+1mLSw0NmtdqJ4j0z95ifCICMsTj/yqE
	NH0+zMZRyZ1ZSsNRJGUg/XRRwB4AbdyXCjX1a01NMV40yIxllgEhcvJ8qLsUaSV0vmoC8/tQupa
	B5ByWScBA7jEmwAX+1B8EOiHU2Ppb3viCNo/H1EeODehAMZGmiIdkJUJdHDxjmhGLYYoVD5zUBk
	D1kTXn9MyqIMF7S5MiBKtkKGybC7ChNwKvxrahvMAwcT6sg3on1ks/2hK/ycHumAQdp/Ti+gJcq
	o1YrP0HQB8/J6BejYs1TvzjPPY7KczP74+hiwdA7CEpXBdugcT9566/4ebTo+Zw+iEXz7MN9RxV
	XKcKYAgTOTF8kmDkh1j+DUQwaaPj9PcaYGqQCD9phnL9cvtZv2bq31pTMyLHDO0WuPze2Gu58Vi
	A7s0Bt2vNLYhXcwXcD6MPqlOv2oZizk0vdCs64VrwcRmAHkg=
X-Received: by 2002:a05:6300:8003:b0:3e0:b937:883d with SMTP id adf61e73a8af0-3e90234d178mr489806637.25.1793144621759;
        Tue, 27 Oct 2026 16:43:41 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.43.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:43:40 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/11] ALSA: virtio: staged capture and dsnoop recovery
Date: Wed, 28 Oct 2026 08:43:23 +0900
Message-ID: <20261027234334.32551-1-mynameisjune111@gmail.com>
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

Thanks for checking v4. I reproduced the application problem against
sound.git for-next. The two dsnoop patches depended on nine patches from
my earlier submissions that are still absent from that tree.

This version includes those dependencies in application order and applies
directly to for-next at bcb4494239f57c98a8ef576566b03f2935b3000f.
It needs no separately fetched prerequisite patches. Targeting 7.5 or later
works for me; I have no deployment deadline for this work.

There are no code changes from the previously submitted patches. Stable
patch IDs match all nine prerequisites and both patches from v4. Patches
1-5 cover request lifetime and error recovery, 6 covers teardown waits,
7 adds opt-in staged capture and pause restart, 8-9 cover ACK accounting
and period work, and 10-11 add the stop-policy annotations and dsnoop fix.

The staging and pause-restart changes were previously posted as RFCs.
Including them here makes the dependency chain directly applicable; I
would still welcome review of their device-compatibility assumptions.
Capture staging and the VZ compatibility options remain opt-in. This
series does not add host audio support to Docker Desktop or enable any
host microphone permission.

The dsnoop fix recognizes stop_threshold == boundary as free-running
capture while preserving bounded-reader overflow checks. Returning to
bounded mode with a full unread ring reports an XRUN. Paused ACK and
period-work errors arm synchronous cleanup so the first prepare can
release queued RX requests and recover. This fixes behavior introduced by
the staged-capture patches in this series.

Previous v4:
https://lore.kernel.org/all/20261025064038.81674-1-mynameisjune111@gmail.com/
Your rebase request:
https://lore.kernel.org/all/87cxsv33oq.wl-tiwai@suse.de/

Earlier submissions, now included rather than external prerequisites:
https://lore.kernel.org/all/cover.1791881787.git.mynameisjune111@gmail.com/
https://lore.kernel.org/all/rfc-v2-generic-control-wait-0.2eddd58a796e497f@gmail.com/
https://lore.kernel.org/all/rfc-v2-vz-capture-compat-0.b9ab4c1540dc4691@gmail.com/
https://lore.kernel.org/all/rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com/

I built a fresh ARM64 kernel and modules from this base with KASAN and
lockdep enabled. All eleven patches passed sequential git apply and
git am checks, and checkpatch reported no errors or warnings.

On that kernel, all 16 paused-ACK recovery combinations passed across
native pause and pause restart with one and two vCPUs. The first prepare
recovered without a preceding drop. The native pause-release regression
and all 13 mode/lifecycle cases also passed, including shared dsnoop
readers, client drop, mode transitions and reopen. All six QEMU runs
confirmed the expected module hashes and produced no KASAN or lockdep
diagnostics.

Earlier v4 validation covered 16 paused-ACK recovery combinations and the
13-case mode suite under ARM64 QEMU with KASAN and lockdep. Earlier MOTU/VZ
and KCSAN results used the previous base; they are not new results for
this revision. Physical microphone testing, 32-bit builds and forced
RX/pause interleaving have not been rerun on this base.

Thanks,
Joonho

---
base-commit: bcb4494239f57c98a8ef576566b03f2935b3000f
