Received: from smtp153-175.sina.com.cn (smtp153-175.sina.com.cn [61.135.153.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2608846D547
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132373; cv=none; b=VLL+shC1wFn6ZDidT8okG1lC4Imy0UsVjG16e1WTArHuFlcu2mGkKWHEXQGd8E4N0b6jFFOQxRZTKWv0r9fBzaSGiLIfMkOUJVbuAo5WqK7vP5VFDzDhZKL5FTZxgtNn/Aw8v2TFimv7Cv+sX58m8Q6Rd1E7Rz26oOa8FOavUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132373; c=relaxed/simple;
	bh=0oog6fnoMU7y9CuPV5VGw84nVGlDmm/A2IEJmFs8T8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NhZzaSFGUbFDQ57vDNEcAR9NVKRZ1bQSxQA0yv+crxlt/uOBkUSXZP5Y/IcMAMDNwU7aXTJYPH849m/rZ8P/tlBwRXF7i6FEG83pGD710F4h/g8qKPioxFpisPRX66zoib6RLgvl7KA1rSV2pHAV/9io+1Cv8w9s/p8uZZU1Y4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AA3FE4A00006CBB; Fri, 11 Sep 2026 21:12:43 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 6BB37A9301B045B0A8F8FA380015991C
X-SMAIL-UIID: 6BB37A9301B045B0A8F8FA380015991C-20260911-211243
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: RE: [PATCH v1 0/2] ASoC: codecs: ES8326: Modify the configuration and add kcontrol
Date: Fri, 11 Sep 2026 21:12:41 +0800
Message-Id: <20260911131241.4188-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2b3120aa-faff-4dea-965f-d00e84aa2607@sirena.org.uk>
References: <2b3120aa-faff-4dea-965f-d00e84aa2607@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

> > v1 -> v0:
> > 	- Modify the parameters of 'find_best_hpf_freq'
> > 	- Modify debug information in kcontrol
> > 	- Fix the issue with the incorrect removal of the jack report
> 
> The versioning is confused here and will mess up tooling - your subject
> says this is v1 when it's at least v2, and the changelog says you're
> moving from v1 to v0 which is a step back.

Was the first version I submitted v1 instead of v0?
In that case, should I resubmit a v3 version to update the version number?
