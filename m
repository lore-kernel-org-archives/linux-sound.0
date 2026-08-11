Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7045747B436;
	Tue, 11 Aug 2026 22:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486827; cv=none; b=HIhSGFh1VrhLrahxxAX22VAJ5vfwTjIT3sH+O4Fx7smY46T4tDcaWdvLOMf1ZbWZ6MOOsZNzj2LJ7oPgL9oc7nxpXrPD9XctGsWc+MZT/xvAS6G+2zQGoHWOTcaL4/RiKxk6nCWP8vmGVxOr5qjg0ZDro7cyR7NjweMpDs73ZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486827; c=relaxed/simple;
	bh=7Jr8fo4boJSL1ugftBxk4l8ujAkN96ATmdOYTBeOT+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l2dAtg+SLlw9hiXKJM9whAZmDQML6fz1WoSeGCG7+36RudwLZPQUSax0QXFeVSBy3e3L/jJTC/OHayJutVeqXQ0WVg4ltzhQFtX4RK1kOSxL5Uj7v375kSnADHFqZQ30YsZIAEhjx6d3yr2aFS/zgX+bkmgu+cw0smMg29IUSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/6D7XHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/6D7XHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDE41F000E9;
	Tue, 11 Aug 2026 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786486826;
	bh=2PqIr4fmxyKnYA6iGlh4mS7egkuY16Gey8TStUT6D1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=S/6D7XHT9FGfHPutlacLa6+iaAPoW4X8kDi6DMftL9dHMThohK/2K4++IZCBqilkf
	 6BsSvVDCRpgko8MCBdqP4v2neSimnmMtzlkoNexz5VNLwz/msZ9rfd1ZgGWbmennQn
	 aj9fVLQEu1oZobXJJFAMRCUk2BsCVeA7T56WG4RIas3hG1hFY7g6qks057tHC0NxNW
	 n3fVUSZh6xHyZIFOwAd8gFYQsMrCn2t+fCduf7n073LP/S4n6SJl09DHpaijzKLz6d
	 jCzNmgU2M247hnrnbk41EAqfM+1tZBV9vbimjl0uPcIzDezhibcDZFoDQ5ZWvawUPL
	 prapXu5z17gig==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, phucduc.bui@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260811100949.61142-1-phucduc.bui@gmail.com>
References: <20260811100949.61142-1-phucduc.bui@gmail.com>
Subject: Re: [RFC PATCH] ASoC: pxa: Use devm_clk_get_optional() for extclk
 clock
Message-Id: <178648245852.119683.17286838052552347114.b4-ty@b4>
Date: Tue, 11 Aug 2026 22:07:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7Jr8fo4boJSL1ugftBxk4l8ujAkN96ATmdOYTBeOT+s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqe6An4W7quwZTF0WWBqSdBtzwhPLKjxzXbBt3+
 pkpojzQv2yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanugJwAKCRAk1otyXVSH
 0JxXB/9NfzVHgUpvmMC0HyLNxNf56+nUpXFElK4awv1etNBi6ectrnvEAf5tQLS5utQYVyYCI2H
 Vl/XZIS0Uqo0qTGP0WYX9MB751jigeXB0w7qyAK6qUAg+V8p/irG2HJlMD5Y5L08w8rqkRuhgIw
 P8tweuUZJkW3TdcARG7CJEjM5VI83phPvBKEubJZVtmUQ4LkfsN2oCQRuxNGCOtLbz5DfaBko9Z
 EtEvJ0vt1j/u9/G0s4n5G4IGcWzTlz+rCISgQ/NCrz2TgxZxfsZly64CbJXuYgx35n7RKcc3qoT
 lIJ+zePPfdLHp/bENbXgrt2eIpfzq021ayy64ouIoNyIg1jo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 11 Aug 2026 17:09:49 +0700, phucduc.bui@gmail.com wrote:
> ASoC: pxa: Use devm_clk_get_optional() for extclk clock

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: pxa: Use devm_clk_get_optional() for extclk clock
      https://git.kernel.org/broonie/sound/c/6ec64d757af9

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

