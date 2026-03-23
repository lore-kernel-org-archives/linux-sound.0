Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55564385535
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256433; cv=none; b=Jk4ktvQ9aaoh7v5wtl+5ZOPI6YvQnScaybxSHQHaBDgsk6j/PwrljSDiKD+lOQ8b2nD1eERlAFjymvIn9XZDTxYdICLoRhIpbI2q8doiO3ToCpnYOL/e5u5dNRji6lHYMxclFva35WofCG2tPp5mDN2thPboUa8+MzHg0Tfic6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256433; c=relaxed/simple;
	bh=qQrOSHf0WJEFpQioIq+31gpjWdkGTgezHWFp2FWOmTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLKBMeYD5Jhhh7YlYsUJ3+/ileAyKRj+fYU72Ejop5troUeuf3kllKhVz5y2ci6gzPnPIer9bSeHXxeIVGzNb9gTu1bRVRInDxu6XWu4b6RP81cvTX6CfcO/psHt7Otr4TDjznPyyZESAdkP7wu+EDLOz8LyiWgKipc/E2HKHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO1bs9pK; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO1bs9pK"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12732165d1eso5006404c88.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256431; x=1774861231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=273aLwz/em1jqAyb3LReQqEgJUsg7bfCsBCihZh13oI=;
        b=AO1bs9pK3lKokmz4hxc8K7CXqoDs3iky16tgRBRzIABUtd4TZhHtgWEVchYcLHpb9C
         sHeLMGIL99+mxv58Ay7t67KqfP2XepXca5I4VruRsxVEVicRaKpAdwcNE5n9qxG7opnS
         OHx9CcRmqI2aKL3RSwVPvvryrYMwGpN8p3EUhCkU2IYRyeIA0J6tk5ajfTLA5XwldF77
         DnmyEuJ41rfXe1hfIu6hCEKGsRbGZfaM/NhtoBen6jW+8XXhS8PHs7hXMZJV/fafmwAJ
         lUU5G248W9LLwKdN4Prd/CCoVp12HiHkGpTmvbx10OwoDi5HYm+lW7ntlSeYa9gP7y0R
         3SRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256431; x=1774861231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=273aLwz/em1jqAyb3LReQqEgJUsg7bfCsBCihZh13oI=;
        b=EPcB1iLVZwm8qmGK9+oh4TdGHq6ZpthuNDHhFfkYVJySW2MMhfkBJe+FZCMzDouAIZ
         jSutwqmFAtmbe408wTYVATXfvzXUDpOMxSaFOtbRUxH5p59GwczgiREjIO5U7JuigA7a
         FwMNm1PBNfYPQl37tIAsq3AhL6E4w21mrsBmI9GfyVF0b9J9KKaaVot5kX7dCUSm8seC
         R0FPynv9UlKz156V4Oo3sOuYTaYTuFv3JYPACqIYqoiZBbmNRc0gji/DCRSHSF446iqs
         6yTCj8f1+XmA/Xdigw8udDJisPhxKjwjkUAsu7hVnU1V4tnDjlGC0eClNhqAC7tXPldu
         qDRg==
X-Forwarded-Encrypted: i=1; AJvYcCUSSu8lTGRhv+P/PnZqpg9JHc1H6iUWEe9AtIykSoOy+1QKdp+VTywcK7fn4CvV7zMvm6vUTocD4fDRzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYSJLVDm0PRlecW3Dn9/ymZOW5nTvIq6cWQO4I1SyCZUXrYrF
	avTz07sP/XpFzAD5SI52tN+Ocfxvx/4V5o2iKxG/a6pqFW98hTTzbxy7
X-Gm-Gg: ATEYQzzEVtiA4GjDxPE9b/UOiOffOlA/2s85RPRAVHJA3KUwl9A/mwnlBZSu+esbJ57
	naF6fPcj7YMLg1m4qyF4WhLLDKiQcUaFSn2tzcZR/p/BAWaRJCQpLKoGFV7RnfJ6Ysu6Nh5ut0B
	BclBQbh0CN6ZCaDx/XFwEPG31Uw/YG87x3g4SxSHAgs43ptm5a4xUVFcNxTkLqK7EcBuu9KoTPH
	JPVy9A/HknxUtKdBlypZ45PxpmI86i9kEdx5U1lWAoIC9UvckU/G6IhWQITUPXw1BEUSnK3jDF9
	l4h6SIu1Z1eeErSJ6Fp7kmphHa04lxsOJoLWpdKX//Mo1MSbxY7pmSk1Vjo4RmT6SACfldBTIHy
	zjdvrruYM3BSjz2wbAnn4oytOOrUbky3cNImaLRpzVNxQxVNUaYAmoYC7SPmG34y82ryWlK03mt
	YzukpLF9lHQTXxLxDdZt1nX8Nd82aMXQSpCz/8SsWj+7WYOIle8ETiJAEdrZSr50r9gG+WbkDNH
	qmawT0DJCelOkq0zbrwCRlad36K0EU13ybZ7gAvF4GU7W0CjKPMo6AMH2E/Ij3GDnw=
X-Received: by 2002:a05:7022:252c:b0:128:c1be:152b with SMTP id a92af1059eb24-12a7263d77fmr4636197c88.4.1774256430993;
        Mon, 23 Mar 2026 02:00:30 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:00:30 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: peterz@infradead.org,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH v2 0/3] debugfs: disallow NULL string creation and fix callers
Date: Mon, 23 Mar 2026 16:58:43 +0800
Message-ID: <20260323085930.88894-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent bug report [1] highlighted a NULL pointer dereference when
reading a debugfs string file created with a NULL pointer. The community
discussed the issue and agreed that creating string nodes with NULL is
invalid and should be forbidden at creation time [2]. Since no fix was
submitted following the discussion, I have implemented the agreed
solution.

Patch 1 modifies debugfs_create_str() to reject NULL pointers, returning
early and triggering a WARN_ON to expose offending callers.

Patch 2 is a code hygiene fix. While modifying the file, I noticed the
EXPORT_SYMBOL_GPL for debugfs_create_str() was misplaced far away from
the function body. This patch moves it to the correct location.

I carefully audited existing callers across the kernel tree. Some
drivers passing NULL have already been independently identified and
fixed [3]. The remaining subsystem (soundwire) is addressed in patch 3
by initializing its string parameter to an empty string (""). The
existing code correctly and safely handles empty strings.

While auditing, I also noticed a devm_kstrdup/kfree mismatch in the 
interconnect subsystem which has been addressed in a separate patch [4].

Changes in v2:
- Link to v1: https://lore.kernel.org/driver-core/20260317185920.43387-1-hanguidong02@gmail.com/
- Patch 1 & 2: No changes.
- Patch 3: Rewritten to use kstrdup() instead of devm_kstrdup() to match
  debugfs's kfree() behavior. Moved initialization to sdw_debugfs_init()
  to correctly handle the global pointer and avoid overwriting during
  slave probe.
- Patch 4 (drm/i915): Dropped. Further analysis confirmed those specific
  pointers are not passed to debugfs_create_str() [5].

[1] https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
[2] https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8cc27f5c6dd1
[4] https://lore.kernel.org/linux-pm/20260318024815.7655-1-hanguidong02@gmail.com/
[5] https://lore.kernel.org/driver-core/8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com/

Gui-Dong Han (3):
  debugfs: check for NULL pointer in debugfs_create_str()
  debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
  soundwire: debugfs: initialize firmware_file to empty string

 drivers/soundwire/debugfs.c | 9 +++++++--
 fs/debugfs/file.c           | 7 +++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.0

