Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3B30100D
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500970; cv=none; b=cIk52x2WSgS8l/V7GRBv1ep4e+HMAjqw+XtgOnbIsvBqIrkG0iyHj5tz93V0jOf8SOhJzkotOsoPEm+4hfv5uxtXeSHoJa8OqSG4jodo53MS5LhwhHAchr17WQ616q1DT/YlF5n+6B0Sshiv+eI2z1UfjoOqvDx63AkYmIABCxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500970; c=relaxed/simple;
	bh=MUMVGL6BijfBS4Zy3vIkJc8DCB6CU0b3nOM8m0HqICE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nsnYMSK13s/+RvsB5c0/A1BWs4xCRqUYvqiNy5xi5KQOMzNR/qJxSdxZBPaYIhwsuKOOoU83oPs9AkjL4D/BW7ejwo+7oJNIOLAHT+B6hBjhLpiot4aKFZujxwkjYfTid5G2iDjPn5ocjHSKkZJu0xLw0AHjcFDKPOdI6io7MoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AK0CbNtq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AK0CbNtq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D22C2BCB0;
	Mon, 11 May 2026 12:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500970;
	bh=MUMVGL6BijfBS4Zy3vIkJc8DCB6CU0b3nOM8m0HqICE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AK0CbNtq7U/r0XvHqPltK/vTr8zwtPhnmrwhTvvDIrFvVjT1ElqQWfB03lxQoLJcQ
	 2+1YN7nAYvEQ0QwWbjiP0eaHIStLez+HEsnTp+BoAdy2+9ex/ysfa9ZglutPna0+wG
	 QfsCnU83nOXybfcl+LHpaAOWcwIBxRQo6voVjkjlAZBBAldxw9lJjyb3zoqZIX4LEi
	 vUmt5q8NCAMAuYQCQsbx6pkJXTHBR7KmiWWN5SA6O+DoPniAOdHluLkQNEaS+iyngn
	 rQnqASOnlkGvr/Lw8aqm+6QBCTBwRCVl9UHyhHQlh2VkkbJ5nlYFskfdyllz0Of9zt
	 pOaFu/dC57hTA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com, mac.chiang@intel.com
In-Reply-To: <20260508104239.1247525-1-yung-chuan.liao@linux.intel.com>
References: <20260508104239.1247525-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: soc-acpi-intel-arl-match: add
 rt712_l0_rt1320_l3 support
Message-Id: <177846135222.988959.14896629537870590498.b4-ty@b4>
Date: Mon, 11 May 2026 10:02:32 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MUMVGL6BijfBS4Zy3vIkJc8DCB6CU0b3nOM8m0HqICE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhizGo+m9/mJtzMdMTVQ3n71W8OAYh+Iytefm1QppS42Db
 ExTxWZ1MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATEddm/19fr/qvP3d+aPzk
 Ocy/tfXNbyzRiKli8S4VE2VsunH1f02gfARn4s2rZ1pX2bRcVf/hulppxbT1Attkjmq0yT9r7nq
 YufkZr2T6qVh/jdlzr1c/qvi2pijmgNsy/8V+iuFuepuTLdgt139j8fL5+ed9SVbfW8/FcqKmTe
 Fq3jtWLu6O4X1jvzDreqeYxd/C5yWLz5TO+7k15a1ivvI9mUdNq676pfWUigpO3yfZ9TCfj9GNs
 +zQGfZFrs7VepEfbzPYKqzQTn8fEmRW9FbvyWSBYMeiQxzL3s90fdWmWW696paX2oq2Qk9TrWXr
 lsvWV577cLL6mxLDwaa2kGrWjXt+vSjlSQgJLgvu/lQIAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 08 May 2026 18:42:36 +0800, Bard Liao wrote:
> ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support
> 
> Add rt712_l0_rt1320_l3 support for ARL.
> 
> Gary C Wang (1):
>   ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/2] ASoC: Intel: soc-acpi-intel-arl-match: Reorder ACPI machine tables
      https://git.kernel.org/broonie/sound/c/ac2f21ceddee
[2/2] ASoC: soc-acpi-intel-arl-match: add rt712_l0_rt1320_l3 support
      https://git.kernel.org/broonie/sound/c/242200c29703

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

