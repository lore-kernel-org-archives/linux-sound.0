Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F1480DF7
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256124; cv=none; b=aRqyFJJLIjBvigK2NE3SGVcOc8lxCyoJdq/IwV+lj/oOL09LecYWykQFDkXrJfsLwKZj7ZiE0p/MIaAuszHLXYjFtOrKFtouagIQ+DxN4GwpYT6+cxljN7ngHeMu4lpz4evUHTQSJG4cw0UmT7qrN1chsiYwE8UYPN4D058e7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256124; c=relaxed/simple;
	bh=7RmgXlgZ5+PELjWfl7P18KEbSrGTQ7mvFuulzZEP03U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lMSNxfIqNlK3n9W7AUvsOrNZMxhM0ZILPAIA16nxCe9B99hqXRlJk4O5KACqXeUS2GVoRiOlrD1QT9XiKw/TOAkQauaT9+Z+DKli/FHy9DX5P5EKylohnbtPvsl99yHDpLmawtt5QQ5sdcbdGEsfZZNUEFzWpUiom/ny4iJAUfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAKKtQQU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAKKtQQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891DB1F000FF;
	Thu, 24 Sep 2026 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256120;
	bh=RyUqhGFtWvNdGvfJGGpu7tIKfutpRYjU8syYWSxzN3Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XAKKtQQUdVF/PyzQ/4anXlm8sSNF7evj3Sot+DhZBmM2w6zO8JtMujOroVkWYX04E
	 IvMVMWpmDNV+hKt5clAuSR2347+lMpThd3KKWQ5pD1wUgLr0A7fIcDP7WeXNt58dVk
	 IBXx6c/5sK/yA0vtDxiDCn8TQngdaWYFlOuqy7CgEvSluIUz3v6ITzc+qTVkyi+IHb
	 +CqtCk+B5bieNHe0efDPkb3IsrXaky8rI4kHXskiTw1JEa28pgE4MJ2tyNvDxf61Lo
	 bGqsrLP88Q7RWXkwRrmCmIhwkVIU9nlqqD3DeeGXIdy7usB9xEG3ron1tIGjHppS7b
	 84aOZcO9UxAGw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260924054015.2600784-1-yung-chuan.liao@linux.intel.com>
References: <20260924054015.2600784-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof-function-topology-lib: fix sscanf
 type
Message-Id: <179024817777.114772.13129084452006538011.b4-ty@b4>
Date: Thu, 24 Sep 2026 12:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7RmgXlgZ5+PELjWfl7P18KEbSrGTQ7mvFuulzZEP03U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtSP1MpG3MfnqaArciwiD2medIVizb2h9qrJQI
 +CM3CyOF2eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarUj9QAKCRAk1otyXVSH
 0CfJB/992DBHiyvJDTgRupjOMCtLhIU/BRnmxzk1EWO2on16rLWRtfguik0EEPNzfjHSb7AF3js
 4SU0BJWW69hV9Ys+I70hFcJpvEKKMt8uDktcrmKezftutKFUiitdYRfSJXRwt3W4F3e89idjCgh
 nlrKDxYaCMoROG2W55v/DTI2WVVlVSrujj935RKtuyGe1TanBIAa/eERoC2jiIVXggCI2bVqXJx
 qYy34yOKJl0lsx8K1NIw1OszxvKGaVPC0kZOe980xVioLChvszR8aFQ7rWDfHQoCyuY/bIPiNGr
 W7+EHuWGfXeDKPRKw5z/CL48sk9wWlKabV0310ofA/TadeUP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 13:40:15 +0800, Bard Liao wrote:
> ASoC: Intel: sof-function-topology-lib: fix sscanf type

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: Intel: sof-function-topology-lib: fix sscanf type
      https://git.kernel.org/broonie/sound/c/db1761980ccc

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

