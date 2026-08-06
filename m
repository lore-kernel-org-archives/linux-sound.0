Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C632B9A1;
	Thu,  6 Aug 2026 17:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039129; cv=none; b=fp1qnXX6SUsrs+oRaseobu7UnrXGVbQbOG/4VratWsejBizppsWOUK4l9bJoyxAckKpOPfbR72rG5MMnn//WonbCpis1hEio1kAaL9K/GB+n5mh5XMQCiRAQyprLxzvUP0n2Lgqd+SBcD8HzP2OrFJ8arxS41MhmIRRlx9HJmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039129; c=relaxed/simple;
	bh=FQsfOcRhw6V6KnsPcJmLhkAdumCQ8pFiRaObHWwwmIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aB4BzhaHwqmf5132qKyAWPLiXWAurv7iJCjNpFFeWCsqPl940ODMN7TBAdYqbQYQGhVaMTdEbGeE9DBd2NhLsRIwKkiu8Jcg4X0JgZBh02hKHdHH0tn9+Dg4GJPWVGfoTnJbNGlWGjCxpKORA7mqqMOYOXNbMQTtFPrYO0neNS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRZaR1ea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRZaR1ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939F31F000E9;
	Thu,  6 Aug 2026 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786039128;
	bh=5ISjmRaF49gdfEavYl+QREhY/gYhbrZDfVCB/xW6DsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XRZaR1ea8p4YRhz9LAGWqY7WidyhKYeoYDGRfYdW4q/TJXR17HQqb78bYuvG40x8q
	 xoFV+iPXf0gxBlIe8WpQScXzG9PF+yK4JunbBq35i05OEB5/wOktSbCq4BlwmMFFsh
	 16VUnFhqJ6nDMscKPth8aI8RPzoJhm9GJmy/fQiUXF8/zz6k6RzRBRp/H7YESnnlpo
	 qu4LkEkabnK4f/wFOf3d18ZWuEjgHyk9dkNpUYA2HsyQMtT2bhg9JlNNLULNWSv7h9
	 0qTaFTTIOTazoIyL+paXsOcJyX1bVtg6NQyCz2GrWfJd8o3rQv4pZ9kpuTkpPGq1fO
	 WkQt+Ca06SmnQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com, 
 sandeepk@ti.com, v-hampiholi@ti.com
In-Reply-To: <20260806053500.1955-1-niranjan.hy@ti.com>
References: <20260806053500.1955-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v1 1/2] ASoC: tac5xx2-sdw: add rev_id 0x30 support
Message-Id: <178603269138.110757.1932011781509514789.b4-ty@b4>
Date: Thu, 06 Aug 2026 17:11:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FQsfOcRhw6V6KnsPcJmLhkAdumCQ8pFiRaObHWwwmIc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdMtUEjAylvX2KYuC8smIhNynVu7RREZC1rdsH
 GPgRzsQeYaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanTLVAAKCRAk1otyXVSH
 0CfVB/4nkUkk4sWJUsPN8Jhu+IoN3TR8xVe2YuFiZq8Wd4MFxUK8PEmoCHkDz3RBQzAc3KHJi/J
 uu6AzY1is6ngU/pZpxcdKA92wFwsglzC1q+3LXAEZQjNz3OVM9xsgCcO3w0GmWq+0bsofqWDdpl
 jy5az0QhTLgyk+N1lXj1Y+3JTs9j46WOxc6P+XwsvppJHtwH9K7oiRKn2YEAXs2gdQXoh4PJEaW
 DBZJlf3XC2YByF7+KyUVPBd3VBQaDDiwqVva9t9UM8cOpJSiKCzpumOOxnRuaY8AJ4HUBCN/9Vz
 ckQgxFgTis0aoivh7++eQmlAa7MLQjLexrnzjSV6tleg8nPu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 06 Aug 2026 11:04:59 +0530, Niranjan H Y wrote:
> ASoC: tac5xx2-sdw: add rev_id 0x30 support

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: tac5xx2-sdw: add rev_id 0x30 support
      https://git.kernel.org/broonie/sound/c/dac366eb036e
[2/2] ASoC: tac5xx2-sdw: remove firmware check restriction
      https://git.kernel.org/broonie/sound/c/92dd0ba8ac4b

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

