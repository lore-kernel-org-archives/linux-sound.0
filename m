Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85247390229;
	Thu, 14 May 2026 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771471; cv=none; b=bHD8CJ+Y3w6ODRbqy0fMbTsth6zusnRj0UJdgrzwLSOgRb41CI4+qc9LUNEdFVcJ8wElPWwQcIYlsqJWBc6CDBTtlBz3/Y2RQ+saUq7ZJo3Q/oZkKW82vUeZA2IusA4HcCVG1ObjjXCTQqMXF2qhDe3VeknzwaAxtgfL18Q44EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771471; c=relaxed/simple;
	bh=XGlRbfx6MjAoKPY0dVYvtTM7BRAnn5XJmlWNT52RKYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pb8IqtbsH4Xbz+4Bjt2gPyVxCCqXtjDxFoevtL23z7CEUjCOpfByTTXOdnlk4yrgkQiI8nVZawzWi9nOLI5VJf2Y9nYO7EI7QkaAWKjkwTNqfe7fk2DojZQq4885iuR6s6NOxLF6Dl/mxmMQ2m57tincQlPvD6i8hIdS2oJRzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8oJHT+U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8oJHT+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7895C2BCFB;
	Thu, 14 May 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771471;
	bh=XGlRbfx6MjAoKPY0dVYvtTM7BRAnn5XJmlWNT52RKYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s8oJHT+UwJUs/dHJazZvdfI4yheOTuhF89MfA06bGzeVmDvX1FPu64CRqwSSFmqAj
	 Q53/F8JCUojzwo8Dr3+ZH92MdlDWEqBUx5rmDc162W+X/TB6Ro2Polzmn5TE6ghLVC
	 IIYdn0ev+3f3Yg8OaLti7K20qwje2NPYhkdYw9oxwNbGAZ7vM4foTiRrYUeLHdifTM
	 QpfO/NixsVqCsgb89zNbOUWNvtwUhnE/dZzE55563ecjLABdLv7m55AetSH/nk5CFm
	 zlW5VG6O3gGlaGH6NFcqvp3IOU1Ya6obeCmienQzesvKSbW9HOQJJDBxecpIhhjVP3
	 bKPQsvbNXTetA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com, mac.chiang@intel.com
In-Reply-To: <20260508101755.1247039-1-yung-chuan.liao@linux.intel.com>
References: <20260508101755.1247039-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: Move suspend tracking from trigger
 to pm suspend
Message-Id: <177877146851.1054194.1064594103504416701.b4-ty@kernel.org>
Date: Thu, 14 May 2026 20:41:08 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 08 May 2026 18:17:55 +0800, Bard Liao wrote:
> Mark all open DAI runtimes as suspended in the component .suspend
> callback instead of relying on SNDRV_PCM_TRIGGER_SUSPEND, which is
> not delivered during PAUSE or xrun states.
> 
> If during system suspend a dai is open it means that it is in either in
> SUSPENDED, PAUSED or STOPPED  (due to xrun) state and they will need to be
> re-initialized during resume (which is done in .prepare callback).
> 
> [...]

Applied, thanks!

[1/1] soundwire: intel: Move suspend tracking from trigger to pm suspend
      commit: acf676b9de0c86bc735a7f04962d3d688e156ffc

Best regards,
-- 
~Vinod


