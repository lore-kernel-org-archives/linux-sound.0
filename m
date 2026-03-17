Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16F1922FD;
	Tue, 17 Mar 2026 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741186; cv=none; b=F9CAJbDRXcTjbk0ZqxHmpWuLcM/JQwLf4LoIiIBD/T1YGJ3+lYn2dE4UF0GhthwRTB12rRSo5zOJXyyZlx52we5cAEwMbvQENK12yLKM0LTXIRxLzSjlko/1avxfT6xdFiB5HpGBEM4K00fNvcE6XfRkuIVlxZDPZPtbFyd/Cn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741186; c=relaxed/simple;
	bh=2czdBKjIJyi28ugBx5Na2+A83jEmhuFXJL+2ttSQXtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zl0/eqde3E5uKUfxCAprLo3WkHklp50LkLIBEk6wn04A7TL3H5x3Zfqt7v+7Aqmo1wh1D/lyimmx1qNVqtRbN7rdZsQtTacLvt/01B/PK2vgEkbSBaW1vicnSItagpyIpOdIjNCNaQf4BqY7ZwykAvHTOB3ncNxndleOaEEr2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll8DbCvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll8DbCvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9AEC2BC9E;
	Tue, 17 Mar 2026 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773741185;
	bh=2czdBKjIJyi28ugBx5Na2+A83jEmhuFXJL+2ttSQXtw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ll8DbCvdax0Pmc3kXKqUWG4W18/9AMqJeqqH5Etb69unY2pMZQRYkjSvgsBFVaPHs
	 Fu5ny6sv0vzUav0BVr7Ohn+YO4x6TctF7STtZw/ITpN18J0CQINMaQUnTckUPbaw1O
	 LPlpQu2WdNzHN2l0VACC8a8h/qSWEEiIbLPsjBAYX6hfKPDqVGKx8k7ro870Dnvmrj
	 T+AvViMUOL38AvS44eEFSdSQdijFOyy8xKJlxrXGp5H1La9os+2k54ZM6/2xAnwARc
	 my81tiYt5/SsSUlyJ022MR0rpQ6xPImYjjYQRDL2gB/FSPaJqHi0AlydttfJWaWAqh
	 NIizrEyr4tekQ==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260313155428.1934196-1-ckeepax@opensource.cirrus.com>
References: <20260313155428.1934196-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: Add cs42l49 to
 wake_capable_list
Message-Id: <177374118369.310489.7824528775515725825.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 15:23:03 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 13 Mar 2026 15:54:28 +0000, Charles Keepax wrote:
> The Cirrus Logic cs42l49 codec can generate Jack events so add it to
> the wake-capable list.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: Add cs42l49 to wake_capable_list
      commit: b8f2d65fec19f3866905ac6ae3deb5c0c9faf162

Best regards,
-- 
~Vinod


