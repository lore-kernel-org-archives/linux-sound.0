Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B983E51FD;
	Fri, 22 May 2026 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445395; cv=none; b=Nofzdf6Cigyu/UzfrhqoeAI5LBJmkn/+L/zY2TpSbzBuNiLpGnGOu8/4cYG9X7e8p7Kyow3Ss70HI5gbXJ/GyadY4VFzuhgZjAIMZ7GTht8exv7XqlBCqyrJSAmlrk5Phh42c1xM7S6NMM024eZCCphtF2IuX0sI67rthA+TCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445395; c=relaxed/simple;
	bh=s0m1yVvlP5iy/V1tzfBAaEA6ySwCclv0mJOWlANyuik=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D2EXJNfvYBo97RQhqwiT9GycJcH9h+kuEnt8nIXbR23Lj8UkCx9erHVXluT4uxUG9iXowmaUilr87xPZwigNtA79RlTn4Dj8gKZg9kRJP6Sru40gTS1bxfImCpx37GBZGis1/OqHXm+ADdMRxMSvydyWlJG0gNQWlbmo0jS45OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/5AfqEW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/5AfqEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F401F00ADE;
	Fri, 22 May 2026 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445391;
	bh=M1HtaYHwU2c0F5rI+9te1LlXdp+ET0zvNtJ4VtJ10yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L/5AfqEW+nsbKuy1EJyFaRvs50DjZ3Uh4uhg+Uogw+7blM/wzv8wLSJqKpOlUPljN
	 CBytV19/gR8D0tX7p8PUNtjCluUAJuKG51T3WEw98/I1FgoOLqh1s7MTHQzom5cPX6
	 9yXa7l4pMhis0WWhRg3pgGPjEBovUFoDxQzyYOwYvC1d62NJqsNQnxw/vhQ9Il7WGf
	 5LlFJtHFjHdIWZGAngDxZwkJ3tLvEhVpwhM9bEKVl5WKF1A7zSDXk2NZDMmmoY4D+8
	 VWLZjw4qYTP1FWumDuz+w6WMDyYsYeTfrKpdHcH9hRl8MF5ooN3NwmYapr6y1SAS0J
	 HnHgZsM4+cpeg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 liam.r.girdwood@intel.com, linux-kernel@vger.kernel.org, 
 guennadi.liakhovetski@linux.intel.com, jyri.sarha@linux.intel.com
In-Reply-To: <20260520140001.1375-1-peter.ujfalusi@linux.intel.com>
References: <20260520140001.1375-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: ASoC: Intel/SOF: Remove Ranjani Sridharan
 as maintainer
Message-Id: <177935842313.58022.12971096659451114918.b4-ty@b4>
Date: Thu, 21 May 2026 11:13:43 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s0m1yVvlP5iy/V1tzfBAaEA6ySwCclv0mJOWlANyuik=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC6M8Yaf+brUuen1k7vxmpMT5pXaEJgZ5lGTc
 HHnh+Kb/0WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAujAAKCRAk1otyXVSH
 0IjjB/0fEZss+YcrkCcXxgX/O2xO7jyVEigtQIAJiZ9hSzs29z0lZCTjbKRVLXlOKPhPH0l9S6y
 NRRYNo9lBjw5bqCH5BOoswRk7Ml7vJCHQDIUtiyzF+KW98ualwn+MM741p5QeNcAgnQFb/MumDA
 yaWD/U025f/OsuC8mmLOGVZkPumNEflmsh5AN1AEXVY8iM8n8nR4EcQD0094ZbNbkORUJQrMf4i
 icAtdcZsXEUjpBF63Fbdg3Y+Wanz0F3YmUDsa/bQjfCy71gg2OoPV5kVJTT+ael5zsyYEImGFnv
 TEAzX5fUkX6t6EfWFCSAKSBxEjPCJnq2SqIP8oMGfa/oiW+R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 17:00:01 +0300, Peter Ujfalusi wrote:
> MAINTAINERS: ASoC: Intel/SOF: Remove Ranjani Sridharan as maintainer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] MAINTAINERS: ASoC: Intel/SOF: Remove Ranjani Sridharan as maintainer
      https://git.kernel.org/broonie/sound/c/2b98b9904047

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

