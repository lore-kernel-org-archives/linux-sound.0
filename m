Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F2049B1ED
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286784; cv=none; b=J9xKNI7lLGZguE66dZToCRbXyLEveXtiBwrrZ/Oxv4rehqkpjqbXB9/YMbKdqKZmPzTUUQziWpmPXERGDLuMR9EoYdw0qlNZuH6Tv8VB3b0AMGvLyEI9jqlZ+ll5ltqHdvrefNBrkq9jGP2z/cf7tNIWWzpRPG4yt6jjGuoy3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286784; c=relaxed/simple;
	bh=Ge2iq89JUgwovgcu+EttDunnOkQ8xF3IclXEGssLCrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D5kj57PNgI6m5GAtTnthtBEc2yGh313iHh4tMC57vIIUjYisKJjwSakfyxb9d9m2Str7AYf1wH1ppDytefffkIKQSI0h7Xh+dyNCEOsIBHXfmLRvm6g2jVJkE/MqX+bshL3rXkvUlhuNqLaQmomj9uA3LN5GADo8Z8pCxwXBCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRMAGy3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRMAGy3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F11F000E9;
	Tue,  1 Sep 2026 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286783;
	bh=JRCfG6Ci2bso/yYu/B886cNsqDpRiFAfp6BKCEPqCHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VRMAGy3s5krcc5Cts3KgyYubZY+7w0A7/N+h0Jdq9Zcj1hqV9ipu5eryK2WLmC1xC
	 cDVp2lDitNAxM1F9WKgThWiGwSH5dDtZ0HiyYZNtvGckdzR9iEXNxhBqcakSJ2yNwl
	 uct9Ow/BpANb7N+bnT9AcVjAP+24K6chiL6Ojrjd4m1Sa3V/A/j0LOB4R+1wzWPBXJ
	 o31Dz7/zqb31ZXcmQ4v2rdUpKR8xbrc0rnbdeH3LXZG5ZNSp6DcXyrpazXEWm6oxCd
	 v+jc+EHcGddKbc+ZkTd1Dwquxc1pIX42AAR9Y8EE6fQyaDaVy9Y1nelMwV5PrBXGcq
	 uht6lOsPvw2ZQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, niranjan.hy@ti.com
In-Reply-To: <20260901021132.231908-1-yung-chuan.liao@linux.intel.com>
References: <20260901021132.231908-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: add tac5xx2-sdw family
Message-Id: <178827077865.33904.4349514121236193658.b4-ty@b4>
Date: Tue, 01 Sep 2026 14:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ge2iq89JUgwovgcu+EttDunnOkQ8xF3IclXEGssLCrE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxc7roKqnjTvulPlvkoExeef/SsqRXGqjyC1Z
 lHMumYzLkaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXOwAKCRAk1otyXVSH
 0CWHB/4yA/CJsV9BGMEh40vS62QHJKqY7FO34NcU6qU2A6Jea7CPg7J0qlVuJwxuFd0gublLNPc
 ZLJd+iZHMooSVx6ZMDpMfdaSXj5/n5kltsKKsk5J2fwJvWceYP+uCJkmbCCJ4mamFlvNrKcVo/+
 XjN6y1lxscwIk7I2SQ95wB8OqhKbAZBIxOWeW9zrHT52kl0PKw6ulup7hGqetfQg4HVAPh/v6zY
 h22UBCdNJpGdPPcc1CGOVzSs4Db6UYOudNfyDBanRlB1tUJ+ovQ98cCrbnxVEQvZqxrD3kEXFjY
 nn2Dmpm6kdUqMfYdxBTw+qgVh+dpdWRVAMVxdcVi5KtGco+D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 10:11:32 +0800, Bard Liao wrote:
> ASoC: Intel: sof_sdw: add tac5xx2-sdw family

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: Intel: sof_sdw: add tac5xx2-sdw family
      https://git.kernel.org/broonie/sound/c/2dc65035eb8d

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

