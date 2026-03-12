Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC7A3FD15B;
	Thu, 12 Mar 2026 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336888; cv=none; b=JDy1aBK5hJWPw5QKfks4ZLcumdnOnWIzryAMJsKIyemAcPtOwB5oamk81tzroicWP4+I5dwg8XQhlmEP54+9kmH7whlzS5t4CjM2pppzfO425nvQMVUzaBirvEP4a4JrptQAzRhucyM99rRrOFZW9CXeiBM947dTNYdU6bK8hqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336888; c=relaxed/simple;
	bh=aI+JWcHqYR2uX9/9wwP7ZkqD9mZ1AGOUvXrTkkqGfqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sig+4DTCcsVEkwtCmejiwKyFEBqnnlrKbcxRuKooMcp57XpW7UL71DmSDgYCltqLfT74MuBrlQyg0Fn+DWOVV0dEwRoyXdKQBS2/FvtJSRp+NoyiIHXgwm1Ih652TIighwnvNwURIj2QIE+mU/WqqgLMHPrEXJ+lMjwePxvs73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLj1jlk0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLj1jlk0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DBAC116C6;
	Thu, 12 Mar 2026 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336888;
	bh=aI+JWcHqYR2uX9/9wwP7ZkqD9mZ1AGOUvXrTkkqGfqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hLj1jlk0GU9bmRtjKV30AA24nFfkOhYbrcZ5Ontykw0FjiqCyj3hriV5NYkIGsv4r
	 CkbvcLpuKsIabT3J8KlOOUNZPoiEpGUrzCXuw9lBncGt3pAI1Y3AsTkUgDK+UqDy59
	 IqSN/jKbwIDyD7K1bAbJZqSLrYy7zRgTrefjcEpIIJznDN/+K1JPxJrY/2QT1bsOPI
	 Op+SKTHL2sv+Q+O/nLojwMCL/6rT4vrdG1kUjCjPYPHXdHt/3wprh1lswNoLt3xshH
	 FHOXnSmJrLAii/2AClWOopBkJgzbiWpQ4LKGnGD7tyncvjJqfnt4bDAQ00kF+j2VBM
	 Y+JqiuHU9Pfgg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware
 file search
Message-Id: <177333688750.302961.12309937197252849142.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 17:34:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-68380

On Tue, 10 Mar 2026 14:18:07 +0000, Richard Fitzgerald wrote:
> This series makes some improvements to the code that searches for firmware
> files.
> 
> Patch 1 is a trivial patch to remove an unused function argument, before
>    adding any new code that uses this API.
> 
> Patches 2..4 add KUnit testing to prove that the subsequent changes don't
>    break anything.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: wm_adsp: Remove unused argument to wm_adsp_release_firmware_files()
        commit: 1eadb7791ee5699ca58920ef705ce0934c814ece
[02/10] ASoC: wm_adsp: Add KUnit redirection stubs for firmware file search
        commit: 70057cfe492d600c2b83598e8b8b64780b2ca147
[03/10] ASoC: wm_adsp: Export function for KUnit test to get firmware filenames
        commit: b4e6b01191afb9516570437a7aff61019134fd59
[04/10] ASoC: wm_adsp: Add kunit test for firmware file search
        commit: bf2d44d07de726b0393439cb4d4defc5cf89a4fc
[05/10] ASoC: wm_adsp: Remove duplicated code to find firmware file
        commit: 2c7c27025374abbdeda201ad103ddf27e8079aec
[06/10] ASoC: wm_adsp: Use consistent error checks in wm_adsp_request_firmware_files()
        commit: f8f0c68c75214e326c0d4cbcab8ecab882201f48
[07/10] ASoC: wm_adsp: Convert '/' to '-' when normalizing firmware filenames
        commit: 66170cc7ed59fb7e1e192e53f1d690bd04e8c720
[08/10] ASoC: wm_adsp: Add KUnit test cases for '/' in firmware filenames
        commit: d8a4c96082e6f5c7aaf6f3e101effe7ff0ea4d6e
[09/10] ASoC: wm_adsp: Use a struct to pass around firmware struct and filename
        commit: 7bca3ca55ef53ca66fdf6e663290d0596a8f520d
[10/10] ASoC: wm_adsp: Combine some similar code in firmware file search
        commit: 8fc5c7895185d1119ae76b509892a1d14e0bd483

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

