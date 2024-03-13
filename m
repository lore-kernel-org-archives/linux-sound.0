Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FA3BA27
	for <linux-sound@vger.kernel.org>; Wed, 13 Mar 2024 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710295192; cv=none; b=QCtO1lB8ZRiBErJxqjV2X+etdl0npebu8sY9B2EyWxzX/vNFqqhplxLBz+HNSEeB1Epqw35dxGR1qe1cmLuPGxq/LZ+gkhW4qrnzPhxBejXVBT2lWbCqandZOC53DYjMbLb9iAeJsTgSJn5dU24Pd/wZkuqFh2VuBo0K6Pye0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710295192; c=relaxed/simple;
	bh=YXfNG6InGs9UX5DNyZ0fj3mfQ2k+TZSoRfrVZzIZuXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sNU7IHfcFUxOvo3hjcWaUlz4GFGLCfY2uq0dAuJdGTqi30RKgloVVZ1252ZgmwJCErmULQaFWyka2BSEapTYAGxoo4yj9WNJJHPkqwkigvlGI2aEyEwZeUNyzkohJCidq+JRid+/ZIIQ6vcXZnu/Bk1znstjQqElCJCSp5uv08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=Z43MnxcR; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="Z43MnxcR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710295186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7XhUhv62yjw/H4r/up4rGeRGhLVIJLq4wHWumME4f8=;
	b=Z43MnxcRU21ECHrcSBE6edJq4r7gNPrqY75C2K+pk0xFN0md4Rlr8absIeJ9OYeZffnvKv
	1VWdrIPhlb/KSf5UoJilfhPNCe/xVY+aaZL/m4DBqp9pup5IhcKRufuikKsBC8O4C/KLnR
	Up76vW8I6d7yZz+fRIc+Nk5UGUiGcbeTTgUwybrejzKB56eF5pbiVR7C+NpueADqZg4iZX
	GkKl1l9C3ket8Ot0f3dOLe21onenCVF9oVlCma+cRYQlKkhijqh1ILMLUySQ0auG+8xfy8
	a+/bP75kcT6gFeX2cN2Gk195Z1gqKDqd8e2v9j8iCXqP0iiA94VwCPIGtxDuIQ==
From: Jiawei Wang <me@jwang.link>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	me@jwang.link,
	sashal@kernel.org,
	vijendar.mukunda@amd.com
Subject: [PATCH v3 0/2] ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2" and "add new YC platform variant (0x63) support"
Date: Wed, 13 Mar 2024 09:58:51 +0800
Message-Id: <20240313015853.3573242-1-me@jwang.link>
In-Reply-To: <a127404b-a071-4917-8ddb-d7371c721827@sirena.org.uk>
References: <a127404b-a071-4917-8ddb-d7371c721827@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I would like to revert two of my previous commits after
realizing they incorrectly enabled the Yellow Carp
(YC) driver for Pink Sardine (PS) platforms.

The first commit was reverted because it added a quirk entry
that incorrectly enabled the YC driver for the Lenovo 21J2
laptop, which is a PS platform.

The second commit was reverted because it incorrectly enabled
the YC driver for PS platforms.

Thanks to Mukunda Vijendar [1] for pointing this out.

Link: https://lore.kernel.org/linux-sound/023092e1-689c-4b00-b93f-4092c3724fb6@amd.com/ [1]

v3 -> v2:
- No changes to content.
- Patches re-prepared using the broonie/sound.git tree's for-next branch.
v2 -> v1:
- No changes to content. Subject lines and commit messages were revised.

On March 13, 2024 at 12:44 AM, Mark Brown wrote:
> This still doesn't apply against my for-6.9 branch.

I've updated the patch using your "for-next" tree.

However, it can't be applied to the "for-6.9" branch,
because the commits to be reverted are not present in "for-6.9".
Below are their hashes:
ed00a69  ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
316a784  ASoC: amd: yc: add new YC platform variant (0x63) support

On March 13, 2024 at 12:50 AM, Mukunda,Vijendar wrote:
> You can prepare patch by cloning below git tree for-next branch.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> 
> while sending patches, please use --cc-cmd=./scripts/get_maintainer.pl along
> with cc list.

Thank you for your guidance. I have updated the patch using
the "for-next" tree as suggested. Additionally, I've 
incorporated the cc-cmd as per your instructions.

Jiawei Wang (2):
  ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
  ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"

 sound/soc/amd/yc/acp6x-mach.c | 7 -------
 sound/soc/amd/yc/pci-acp6x.c  | 1 -
 2 files changed, 8 deletions(-)

-- 
2.39.2

