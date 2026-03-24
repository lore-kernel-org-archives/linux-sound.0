Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98E30B517;
	Tue, 24 Mar 2026 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382049; cv=none; b=F3arvuOHlQnF/BlwyWWohMdIKGXyz4t83ERwhJqFgY6yXdZ8Y1FhkH8Aosp/66UznHPxiO5j+0CZ2FwFwPyZbDAXMGn/VELLhryb/NoigdWB9mHXkkAtWwAn3lazZ/4gBrVo87IC/eXx/slhYdmXytMz2SElb1p3k5szwOkQqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382049; c=relaxed/simple;
	bh=HQURqJAd1BBhIuDWiRqfputPMN8/xfNewOJFHjftDFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJpUvoQpSFhHu62OC877FTjns7h47LenBosMAoF+YqWuDi7qCLdW9NzbKBEd6bTpCNDsNOdfRMX/iqLY+muzZ0keApuimxBO0mt1etAFxqeUkMDALkE/kNNVNDqwxz1Jdknx0S/NCAGihz8Qgyl6KkbmxNEZmBYFkYCzRWAx09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jpPR/w5+; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jpPR/w5+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9nBnkj9tfTuMXhIzz+DGJVWVI0zu+01Vvu5cL1hf+R4=; b=jpPR/w5+QDT69WE/LB7EDTmkVn
	xvQuE1G8RK2io4DmyM8p85uN70mgpvwvel7qm5CHpk50bNHSmLBNxJBnZyFr2NNhG2g9wiMSS/Zs0
	78ks52yvecjAVEFvZfUPrFwFOBdPpmfIcdx+XcWnf8tNGLE+XYhJdQwAuv/7nu5I+RbuhNhTPMLuU
	Ckpn1sCcz9nSFdG4ZNW5bfV+aumGT6BT4MnEiNIyy5skJW9InBXi3o2QrfFzL+0mDUWtBK84buBZx
	uWKb39kzkuiNXC7l7oW9btdK9UhWSr0bDbdnQKx5cHdLAhdrR549NyT7r3mX6GJ4YopC10+AQ7Nt1
	Yem/EVxQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH 0/2] Add SPDIF support to RK3576
Date: Tue, 24 Mar 2026 20:53:55 +0100
Message-ID: <177438200683.818857.15979454514161981065.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Mar 2026 19:22:59 +0100, Sebastian Reichel wrote:
> Add SPDIF support on RK3576 in preparation for Displayport audio
> support. My expectation is that Mark picks up the DT binding via
> his audio tree and Heiko picks up the DTS via the Rockchip tree.
> 
> 

Applied, thanks!

[2/2] arm64: dts: rockchip: Add SPDIF nodes to RK3576 device tree
      commit: edd3173f3d4424861c1e036b76f0f30b581bb4bc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
