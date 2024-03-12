Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9ED56B9D
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710261217; cv=none; b=LBMOgEhUzWKmbQIUzMHOHsBf8or/zCFgms4H0pnAVu62BppGOxIwJCRzrlGSUY7sIxHFPdR9i+fGJN1famsu9gPopOSHaEP/EuM4FTuIbgWQyvP0AgmO1c6auULnjJCNrnqzqOgCVe0uv6ksGdNVJANbvDR8KAAIdHDDXWH2VAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710261217; c=relaxed/simple;
	bh=QoZF+wotfcjfzJ49TM8Y37CXTGWhSWpVgYgBN3fa1Fg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sw60F6hY2l8FtbTRbl7WzJ/M4JIa9+CcP8axeDQj1uBC75C+fkW8OfdnksBgksQBRz2BN1uq2qXZAg5zGZHop5rz6CMIjj5AisHjvB3NO6ZqIoWCfXbGYNUXg6oR8nbMLPsGU8sKwmBjlLhK5Y7Z0NG8mPqEQjsaRb81g/E9+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=xNuwUL5V; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="xNuwUL5V"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710261210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5az1bLOjFVP6Mu0JRXNcPRiZtXiROeBx+vax0XO9DPU=;
	b=xNuwUL5VkzNY/q4xyyWLYeqL8IOyWFRZMvDb7V4Av7SYBVm3d0M3AfvqkuIFbGD5OQZhMC
	9jaWHaG3iKAlT9vzSLaTAQWp1TdS4fNYcf4gHR+/ctsAlYtin+wynnm4X6ojb4C3wX0l8g
	odlLQt9gN3tSN58jd0+oQEKKRax8oYgnxAzo3nw7vSGk65nBgga+DzZ1diz88BFA0Bnjt5
	YmFXf8nUWdHtQoe938g2et2hw/x2vHB7YqmuHAX8EAL36E6s8X/FBsuo83Fb0cjBJP20Qt
	SPTU9lxsuGpzQJKed+89Azj8UM7PN7O7+CUSrjCKE9XwMd9DcM18PoKR5IY1tg==
From: Jiawei Wang <me@jwang.link>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	me@jwang.link,
	sashal@kernel.org,
	vijendar.mukunda@amd.com
Subject: [PATCH v2 0/2] ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2" and "add new YC platform variant (0x63) support"
Date: Wed, 13 Mar 2024 00:32:54 +0800
Message-Id: <20240312163256.886831-1-me@jwang.link>
In-Reply-To: <a9a4f09f-f38a-48c0-81dc-2796c6126e3e@sirena.org.uk>
References: <a9a4f09f-f38a-48c0-81dc-2796c6126e3e@sirena.org.uk>
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

On 2024-03-12 13:14 UTC, Mark Brown wrote:
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

The patches' subject lines have been changed to
ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"

On 2024-03-12 13:56 UTC, Mark Brown wrote:
> > This reverts commit ed00a6945dc32462c2d3744a3518d2316da66fcc.
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

I have added descriptions around commit hashes in the updated patch set, 
copied below for convenience:
1. This reverts commit ed00a6945dc32462c2d3744a3518d2316da66fcc,
which added a quirk entry to enable the Yellow Carp (YC)
driver for the Lenovo 21J2 laptop.
2. This reverts commit 316a784839b21b122e1761cdca54677bb19a47fa,
that enabled Yellow Carp (YC) driver for PCI revision id 0x63.

> This doesn't apply against current code, please check and resend - there
> was another quirk went in yesterday which might also need to be
> reverted.

I have updated the explanation for the first patch for why
the quirk entry for Lenovo 21J2 should be removed.
Please find my updated explanation in [PATCH v2 1/2].

Thanks for the review.

Signed-off-by: Jiawei Wang <me@jwang.link>

Jiawei Wang (2):
  ASoC: amd: yc: Revert "Fix non-functional mic on Lenovo 21J2"
  ASoC: amd: yc: Revert "add new YC platform variant (0x63) support"

 sound/soc/amd/yc/acp6x-mach.c | 7 -------
 sound/soc/amd/yc/pci-acp6x.c  | 1 -
 2 files changed, 8 deletions(-)

-- 
2.39.2

