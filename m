Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF33F788D;
	Tue, 17 Mar 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767316; cv=none; b=Y9t8YrURhbH3Akge8lkFhtRuGYw8zAPpHhB8+izTMCdYuhL7sL9+SdlOAiKMhvwF3javkkQy4rn74YolbIpP4BHMim4FuHr2+gDHtF6+dLKi7hgrM1HGPOwxu2KjxN1PwmW7Knj0PqXDSW/9aeaI1HQsp3+5j0oUI55zxwLF3bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767316; c=relaxed/simple;
	bh=OYKACKHn9r18VVAQQYO3XCrcZvWsa6eEUXZQRmgI5C0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Uq2Ajne27mpZJTgOdiNP9W692kQJS9B5ygXhMb+dKshmYyMG72KyKZeGMEHH0QI/c4uDGeZQAVU3QvZZrHLPsWl/aNVZ5FEtGuY96XmN67fIKj35LvbcRHFwqpJR8ZnpMExBks6FfSU0fSsbr/i5IVeX24DUZJL/BjIShbPhxL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhvZZBY2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhvZZBY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE03C2BCAF;
	Tue, 17 Mar 2026 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773767316;
	bh=OYKACKHn9r18VVAQQYO3XCrcZvWsa6eEUXZQRmgI5C0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rhvZZBY2U1mkFiKJSa826Kc7/gzYFZ5jEiwCXQnVS1v18/CpcQgiD8yLe10ccgZw6
	 rJlFDbVK80uWDDmJujHFEyNr8h5sdpMmPsbx4bou7op6cEftrXfe2aI14MyVyefzlt
	 hFlf0rFejR8e6OWjf1GEuAHpNP9Vkt9oxLGV3CWZ4Ox1fhf6QZpHKjY2lkwXFSDtlG
	 t4ibFiC8FcvggvF2ld1UFYcQravWyOc2zuLlTAL29stP+rNb1HGzHLtW2Kl3u6YzVX
	 jAaeF21hSn+OaQVE9dlnA3dfV1u0xT7/sLjg3EVyKaue5fLzuKpTEw9BbZZ4iRLGI8
	 SEbfKRPG6l8Xw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
References: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
Subject: Re: (subset) [PATCH 0/2] Add SPDIF support to RK3576
Message-Id: <177375071091.66172.9619091096870411031.b4-ty@kernel.org>
Date: Tue, 17 Mar 2026 12:31:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OYKACKHn9r18VVAQQYO3XCrcZvWsa6eEUXZQRmgI5C0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuYqQC0mSRbvylEYD8XOwmbfCGbStTFm5gcpB+
 WMc5ukRc5qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabmKkAAKCRAk1otyXVSH
 0HgGB/0VtBFyeChYr02uBJH0w2HPP0KbeANerijwZkJYYAa7H7iiNfnxSOqKy32XDMYLLMFSmSh
 9ANd6QWMUNAiM7awG7MWSMr7aUaKM0PFWlO5Guw0Z+m36wqmLuwC+f1/shA71QEKh7FDbSyXzQp
 pQGlcivQjzR0cVYGA5L0HU4fhmgMRj59s1NtA3ja6USpSwAot4tO3GKBHwIQWTz+lq2TJYwsCve
 jtLg+2dVCHiEN5CE5XaqrL5eTjNoWggtsg/z/Nf66rK2mCtFO01gBPtiAMbJpZ6Y/wiJk9j2zYl
 C3Ig1w9XCfUVoeQXyVHXKRtCjgSJvaVaJ/DUZ4PseKCiZuXw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 16 Mar 2026 19:22:59 +0100, Sebastian Reichel wrote:
> Add SPDIF support to RK3576
> 
> Add SPDIF support on RK3576 in preparation for Displayport audio
> support. My expectation is that Mark picks up the DT binding via
> his audio tree and Heiko picks up the DTS via the Rockchip tree.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] dt-bindings: ASoC: rockchip: Add compatible for RK3576 SPDIF
      https://git.kernel.org/broonie/sound/c/4eae391a8e4c

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

