Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057E4779A9
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077673; cv=none; b=ExUwS6wh5yDYeZOnl0F/xDDpByTPey94+w0aIeA7X0eb2xkkQlZRZzXCyJTbWAoW5Fd9zl3RrvazndpnMSULRH1ooaDEeW1rjU099wvnxX9fKz5pOaVXZ82nHYsDVbZr2aNvx7OndlplN5gzsKCgssPJeJlnAHhhltaRvliMmXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077673; c=relaxed/simple;
	bh=j3v0UkGE40MF3MCKgxxunmN85SrHn1FuBZECnOW87QM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OGPdaCZXmeNV0fn5792wogNphApYeSfOOOHCj1YoWhOo2aAgyuAn97ubQP2Xa7nyiXu44Zuh11V+sUFozMm2A5WjSbTSekq7GqJUY6Etbx+8cF7E0Ajnl6O08XBZA3o/QRWoEn6JY4RbTpJ4DGxKvJwHIUqIQHcJipEqY+a/C3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIIuMBao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIIuMBao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0F71F000FF;
	Tue, 22 Sep 2026 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790077672;
	bh=Zrct8WoXon9nd+df3AV1kdUnF9xhAI89ffyRf5++J6Y=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WIIuMBaohGRCOeDQlhEptH0s9eDTh2vGeCDiLf1CbDIqFdmyjPGkqDKgQSHQhLM83
	 fjz7xpq0aP1EmpoV6rPF4QZQktHPRjopzY+JXqEcACLKbmuqA0OrfvpdFyWDuS6Wfp
	 nEL9/VXYNNyXESnCt9QrkSSQeFhDyS7vOPcAetcogc/9cvWBL0ADWaWdG/JvSgy7In
	 sn6ktVMK8T8V2Pbb+gZP8u42++Yh/ucA2fOap7oCNW1HQ8onZLtjf1lTk4mTI6A8mK
	 8w4Ow+gTXqBhFS+n9+Qog/6f3zmvI231k063ALhJUpTLZ3ky/QRrnwwTGOQ5cNAuAN
	 qhH64uHy3KW5Q==
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] ASoC: Intel: soc-acpi: add SoundWire config for
 ASUS P5405CAA
From: broonie@kernel.org
To: Antonio Di Lorenzo <antoniodilorenzonap@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260911094539.237430-1-antoniodilorenzonap@gmail.com>
References: <20260911094539.237430-1-antoniodilorenzonap@gmail.com>
Date: Tue, 22 Sep 2026 13:47:39 +0200
Message-Id: <179007765990.322763.17356606026712759937.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=541; i=broonie@kernel.org;
 h=from:subject:message-id; bh=j3v0UkGE40MF3MCKgxxunmN85SrHn1FuBZECnOW87QM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqsmrh72i0quFK6zBwZlujvdtJJxwr3pkEWvlGw
 BDg+7oetyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarJq4QAKCRAk1otyXVSH
 0AG7B/4uAYNK7yXKrhMHs92nhFV/BXIhJuWu/dP68MrJcu8On/dgq9FCxWgyxyU8jGBJ5EuyhIU
 E+Pdlq4600pE1QBDhNiSs5OFPz6Ct/OdcvpR9BWWhSiEv/s5ErqdYlB3Bz1xd1FmJFfqbfDREZi
 RMyAoWraWSICWBzoY2mPUn5t4MOOj7hoA1AEcjy6KuleBtS6uXABic7FpE6zB3RRUXP2jo3rIpY
 vFNzo4IvbTRC+FNAW3/kpZcnD83o0UBu2SUdmLWHKg2m7Aa67wyeR9hS1OrZCgFC9YzGAB9FOiw
 mO8tockDztNhBLCHiuTWZLHWP6n5Thdwrvl/a3Chh5C7ZFil
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> +	{
> +		.link_mask = BIT(1) | BIT(3),
> +		.links = ptl_tas2783_l1_rt721_l3,
> +		.drv_name = "sof_sdw",
> +		/* "dummy" tells SOF to require function topologies without fallback. */
> +		.sof_tplg_filename = "sof-ptl-dummy.tplg",

This looks a lot like the default that hda_sdw_machine_select() has,
754b3dade5dd ("ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721 related
match tables") removed a bunch of board specific stuff explicitly.
What's the issue you see without your change?

-- 
Mark Brown <broonie@kernel.org>
