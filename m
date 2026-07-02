Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2D2DEA98;
	Thu,  2 Jul 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011787; cv=none; b=jEJz+oZPnCvyQIr9Z/UUpoxe7K3bMOY/rEhUhnvVHIefUti0mMRrujz+GnOWMcHQ5zBDw6s0pldcfY/8ug8iIoYM/lnq+KPtjZbLb4tXCa2MyLcDqAiD86g02V33ZMJ+VNCJg/5TYLz/q21p7+Tq/b4iZ3Uw4aog2N3LPl3Yiic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011787; c=relaxed/simple;
	bh=Q4aVtSlsXGg89fqzCStIGMLeM4mi7H+ta6F59lsd19Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gJOAEWqkP5Ih6Fa/09hGb4V2zUkUruAfpucey/ljX0caryv1zsWHWcL65MFxkUZqbsrBgMUvt10rOj155o38dfaVZVHl1cU6gD/SGEh+s9OU11rBoaBTm6knoJLmdyF3tSX1MxRQiULIxLv4I70HND/XZNDC28Dct2Jz1I6C5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5mnZGBL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5mnZGBL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9360E1F00A3A;
	Thu,  2 Jul 2026 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783011786;
	bh=/hovZZSSMIn2GDBYgSvSdi5ajYHoSENICUZuH5ZffU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=H5mnZGBLodL8OtfDsl0PdPZQ8EdYsTgs6mGzukJMWjtvW33gySFjyr9CeZLyltYgj
	 x6Iz9lnDTTn8zNA6XQNAzOV8woEhTfUhRjzm6uhAEtviTWGnAvadoSn6ujwRJeUZNW
	 lr/iGlyXiCksh6339OyGkV9z/bPMYn0PFgssGKAohO5eaeK/Bbe3B4SB+JsLgj3N+1
	 noDrQW3zTrTtVNxnttEZ+4KN42VEl4lNx2xujYkcTuzuc/cRrEb0lCx96drNZ7WdnI
	 Jhels+20uV7RV+xpvB5GO8k5N5WCvyvh6Oi9XIWLVEYs3Vv7JBNuvN9mkusGj2yy6E
	 BctQ+bmpU3egQ==
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] soundwire: qcom: Fix port handling bugs
Message-Id: <178301178422.772155.10744263110112382141.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 22:33:04 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 01 Jul 2026 20:30:04 +0100, Srinivas Kandagatla wrote:
> This series fixes two bugs in the Qualcomm SoundWire controller driver
> spotted by sashiko-bot:
> 
> 1. An off-by-one in the port exhaustion check: find_first_zero_bit()
>    returns the size argument (not size+1) when no free bit is found, so
>    the existing `pn > maxport` guard is never true.  The driver would
>    silently assign an out-of-range port instead of returning -EBUSY.
> 
> [...]

Applied, thanks!

[1/2] soundwire: qcom: Fix port exhaustion check in stream_alloc_ports
      commit: 6ccec91c3535b07310e12d32fe9c67ff8d31d965
[2/2] soundwire: qcom: Allocate sruntime array dynamically
      commit: 4f9df964ba4507958df39612103d0eb318b1e3e5

Best regards,
-- 
~Vinod


