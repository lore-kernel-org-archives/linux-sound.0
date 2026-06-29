Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29655407CD1
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818224; cv=none; b=erw4HTAvv+IBoX3bunk1duYpIyfZPSpaq1joiOQHsyuwiMbmfSLitVnt4LcYzcT+eAGPUV0/iL6XdhF7Ksn2J25usSraz+2t1EyBrHGt9OtV5GxcdrrbX7qS5AqXTPIwhTxXk4Kd7ujo1wOKkoAOUmSuvoWftvjleqJP4EwKvgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818224; c=relaxed/simple;
	bh=XWM1tBSmHmcvvvMLnUM5en612WeaCaKVmBqXFYQoHAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uTgIPpnga4XVDm8BOm6mxxQTLJNN5QYXQJ9gQeqkpkPDA8O3U5vAUQN4gVpYOQYTHoubLRI/R/K2jZ60S5rXASytcua7g7TfaBHx+HnCw1KXySV+ZHS9Eqtz7dXd9dLY+ITySick73gTRPoI+2tX68E+02EVzS+8+8rrfifTnZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSV+QAJC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSV+QAJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1861F000E9;
	Tue, 30 Jun 2026 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818222;
	bh=JCUTcEhXamoZQUFmoPDoRoQqkyUwmtSTegiBq46MNLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZSV+QAJCRNDUPUY1Iad7XZPbJ1sdctv0Ap/1TNrzQHnxB1WW1wJKu+pEmXdVc/xV4
	 GVQWrZ1wy+apV2QYleRO5vD7TaLv6PVeJI4kN5KKky0Soq1oIM8xypM7F8/AGr5fhi
	 Mi9p7PfmKHfAWnnYbFBtbuOBth12ywMnfkfpFVevpOKp1RCY2MKREdJPmmOLnAssXK
	 oyPL0yswibnRqBvIJ0b7LKsuVdw2QsuDYHMdDo6NfQ2Va1eHNj6kDUzegsjPq5d/gQ
	 hcbEnmm1Jlp3ScMrQC2mm+zqwG70T0a+JJL2uIxk95z6Qabt3ql/2yeVMfBzTXcyjG
	 P+rJp/Mb3bmJQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260615134439.1044872-1-yung-chuan.liao@linux.intel.com>
References: <20260615134439.1044872-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: add Intel UAOL sof_ipc_dai_type
Message-Id: <178275426019.47562.10862524279863154430.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XWM1tBSmHmcvvvMLnUM5en612WeaCaKVmBqXFYQoHAA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WsLvYjLcFtGCOs2ZiTp12dBWvBMySGDZ4o+
 iX8/YMsxvaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlrAAKCRAk1otyXVSH
 0KLpB/9rVtUZrb5h3zNf23UQHL5AWFVzt1af0HgZgAMwdDTg5e1jrcfKV2aO21LPAPEbb25VCOD
 //TKGj2PQXmP1+XXTkyNzKZXxzlMhOJZxnG/aICXmHhT6/Ky0gc5c3FgplrHseaKbMJCTxtbGdx
 PbvRq7k1I+loIX3J6XRr3rPYfoj/VpdiojbsROPuqbgwZlKZtiYBlWlQE0DDR6x1bv0PGKEdDmG
 1L8Sg/fQ89FvNJY4On4yVZEIsA3zcCBNvGk850wNZ1m/+TvABjRcz0eRtPhuVWU+OoxE5W4J0Ek
 ovQU4uPJSprkeiXDd3VXzsQMIRjR++vSdNfkwADaMUiuLgWD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 15 Jun 2026 21:44:39 +0800, Bard Liao wrote:
> ASoC: SOF: add Intel UAOL sof_ipc_dai_type

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: SOF: add Intel UAOL sof_ipc_dai_type
      https://git.kernel.org/broonie/sound/c/e9f08e779976

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

