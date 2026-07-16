Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78E1A6812;
	Thu, 16 Jul 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214967; cv=none; b=G5PDPqeFb6AYtDqw5jVClSmuaH273VjGcgZ49pfQUtOaFVgIzAynQtrdPkB94/b/zzcuLaNSe2oUhRocBHbsC0UjdGaMliGJRGgiattGA4sWU5KDtYhIqLpPFQqOROe8k0HVx3zifsvYQ7WByM8MkhnKymwsqSedu5hjO6VHxSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214967; c=relaxed/simple;
	bh=0d97hdBkKCgtjeKB/DYJ1fSv9gYrOqr3P3bJpQobmiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ird5+vMPGKOcu2avtKhtd6/oyWu2lkqaH2CdT3hGVYouhbKNW1EfCeDhrBfLC6ozgA5/NRFpTOLA5XNOxoLW9m0xuCt1Ck8v3Ankhn+SE3iaynoaTfTKDZp4WLIgVR+xcmA4AqHEAQweZatXzYpJ6yAaYztI/bHM2pMCeeKLAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaD4jpDL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaD4jpDL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45511F000E9;
	Thu, 16 Jul 2026 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784214966;
	bh=GhuMpnV0GoxT6dQReM554A1hrMJ1miS8+Sf/TVkjPrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SaD4jpDLWqWMH4sbDIS4F7CMxIQidYsq98lnHZA2fZYAsh7WFpQZlmo7cViGjZKdD
	 aPCNsbl3cLl1PNc6GAIOnhr/6PdpwonqoI9O78LaOy3F+QJ6caSHtj46cAIVIra222
	 yINLm1gmJKcvRzTEOH76azIfu+QK8R/NxP0xcVxx8VB1wG4xmCObnuimTKDWBkyx+Q
	 Ib8wBz7yHGoCYtZOdWoZLPPzErA8e3LZvkXYgfZ0X4exhNMqym8fi2d7N00atoSI1J
	 8WmURsPdj9X9dnjmcoPs8tb/Bb8KlrtOgCA5hV1lcMo1jySSGxyyYJ1RHFQt6wD3xV
	 KS/Vfutz/sIfw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260708140039.1993489-3-ckeepax@opensource.cirrus.com>
References: <20260708140039.1993489-3-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 2/3] mfd: cs42l43: Tidy up formatting on
 sdw_device_id table
Message-Id: <178421496367.1419983.7095760057631593591.b4-ty@b4>
Date: Thu, 16 Jul 2026 16:16:03 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 08 Jul 2026 15:00:38 +0100, Charles Keepax wrote:
> Remove spaces after cast as they generate check patch warnings, and
> update the terminator to better match kernel coding guidelines.

Applied, thanks!

[2/3] mfd: cs42l43: Tidy up formatting on sdw_device_id table
      commit: 7d044cc604923749a8c2edb321a40cdc0e592259

--
Lee Jones [李琼斯]

