Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540656;
	b=TOfpuntyQp1PJgLHA5PEkiyHCZNQFMqPHPhGTYiyFnj7GsCd8jAMW+iPkKaSKsUOkIh1
	 ROInwPtNsQF9vo+yp9V9tapEF0cT8X7rILOTEVKUfbLCAYN7c4m7itCOk9paeJh8VDrTr
	 6ZpqbmEnYstAw5juDKpVNIkaSmvKJDjBjlZ0RRFuxMa0mOwIXxaP7okyP5ShZDTEIKLD/
	 frXQAfcluNwJ/sQGhGAGCmT2tBJg0PzlMhgSM2zp7sGEJruWUBvaVf+xq+JzJM6y1rWWD
	 cnUvZjHIUmhbMICtfFrxVhH2KvflOZp2MYdJ85asfUFu1FcruSHmR+8OPFoR+oL3wMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540656;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Wq3FtwAqAn8yobhq6Ev2PwugQaM/itA7ndReOIe27as=;
	b=c+b1kbICxy6VsZTraP7lLWamMAfyfeEnwVMuWnc1KFOmOokK5ZcaygvBKPFWrgmVQ0JC
	 34AnWorK3Ccjyan4f3iygHEtg9wvdrxSToJAOvYkSIo1ZB0zYwd170HmyeWWEp5XlKZot
	 /tF/t7QwhsrTA6VVrP9dG3Q/YQCalF5cCfKuCYlPNio6hr5aCeWJ1BAZzT9w0tdAqVdR4
	 vTJ+TWx2Cg2mgA+SdC/rhqlK57hIQ7N08extQ8Vp4GAUuve5CO2rHQxkb89aGgHZICjbV
	 T1LaASXwMM2SrmN0gCPk+WtUlmbtXqm6FW8RohdPrX+U99CwwY/XALzmGWsZi7xZf+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwJv7FXO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ECC606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwJv7FXO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6CF1F000D4;
	Tue, 24 Nov 2026 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540656;
	bh=Wq3FtwAqAn8yobhq6Ev2PwugQaM/itA7ndReOIe27as=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MwJv7FXOyPjs3t1+ppsbpL8tIaMbHF5YTmnK9IEs8O8wt75/MoLzOEGSBnU6Onx2u
	 8UBwBKN056RLK2S9OS43aijvhW2YkPMgpJ1eTuOPFWKNOzOKZ67uccYAKyO3wc6Gbr
	 d0KI3+SlVtDl1qT6hu0KtttAJSHVNvbuIwAkRtVb2iZYJBMSEuFRiJXu9rtFTFUdTW
	 QjvExGgTfcaV2fkFkuioIWkzH7tIilq261mqNsGMHMjBf2uonQQa5dFhVQ8ZQyNdK9
	 rXe03Nn5738LH7njXYYj4Hlg62ukgtnbLF4SgNtUe2kJlRZjfQmGAOaG6AjL2yBp56
	 7ONz0tFb5c6Zw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Qianghua Wang <qianghua.wang@senarytech.com>
Cc: lgirdwood@gmail.com, bo.liu@senarytech.com
In-Reply-To: <20261117060213.2327503-1-qianghua.wang@senarytech.com>
References: <20261117060213.2327503-1-qianghua.wang@senarytech.com>
Subject: Re: [PATCH v3] ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC
 function
Message-Id: <179552945829.264265.6367507935094765580.b4-ty@b4>
Date: Tue, 24 Nov 2026 14:10:58 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PMwldj8gpm31tvgH5W3VE4gd4E/893bdFeNycI1iAvE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZj609+auTYSFX3V+dXYn/owuM/V/ErtDJ3GN/fBnPt
 RL/fQkBHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIg22MDLefZxo0ucWJlaZ0
 ffwYoPWQjSuguWdmY+7nqXoXwkJ2rWJkuMnSt2DFpkMT6x4nFFdzbz+lHl9/6PJshpDE5+4TDzG
 WcAIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 17 Nov 2026 14:02:13 +0800, Qianghua Wang wrote:
> ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC function

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC function
      https://git.kernel.org/broonie/sound/c/2f49d514266a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

