Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5136EA80;
	Fri,  3 Jul 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065480; cv=none; b=tDy1iwTkg/uFwvQ1OLmOjKhOWn6sNkTnOyCFYYA/tbU5DvbhmdNaLYM/VSwYHH+amPrseksXAIjdsMLgz/8VYuswM+PwJLovVlLRxdt1EMtey7EEKmBL4ROL8IilpkPkN+vO0h0zU5KpCBCDzWQvbQDCf0O/PsyJWhgnH/nP++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065480; c=relaxed/simple;
	bh=QqMAmmWsWGziZkiLDOIZG39Nl1QwRx8vulaAvWDhdyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELPmFaBa/KHaTvAgQGq1Hj/XvaHSZ0ogpxjT7/ew1h03l5ZHp/OU+VxkQUMW6nojTAUMmHx8bYWR319pTp78c1x2NauhvOk4DG5+qmZnhnPCYlWDvofUmcRvnzDcS65bhsspF5qYJrIpHrdIOfTDuuup34zR7l5213OcJSrf2BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTcc/cBS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTcc/cBS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20361F000E9;
	Fri,  3 Jul 2026 07:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783065479;
	bh=FeGCgCuJqvP+G8Eppj9siBOA1hHncBneFe2lVJW1ZJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WTcc/cBSl825OC+ck/HfN4bHY4aJMIKnIi3MC4IV+m5cObqY+L2kTa5fyHuPYWgPC
	 h4shs4D+ISVfkzrQuQM24HYQG/zW5jcixXKPY988RZv4O2ivFooZIxtDT5rArkWZuA
	 LYol9Gk8FNAHHSydMAEDQbDsyZ9qg5JrcZxp7MRXvMqRu+EKQ+/sbjpJbXHBmeVmcF
	 gRiX82MAHOfFwYlQV3qwOm0gX8BD1A2nNYzjR7RhG3U6FoHEi+9ghzwYWuQ/s4kanN
	 HEMajuw3L95HWHHksHyahx16zX0PFPwxEs/Vu3XHqmO9Ou5u81iEx8vqrAtKGZ+OGU
	 3pU3F2IpND/Ew==
Message-ID: <0e1860c7-08cc-4bf5-b913-80d1239c8b5f@kernel.org>
Date: Fri, 3 Jul 2026 08:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/1/26 7:44 PM, Ajay Kumar Nandam wrote:
> Hi,
> 
> This series converts the LPASS WSA and VA macro codec drivers to the
> PM clock framework for runtime PM clock handling.
> 
> The runtime clock enable/disable sequencing is moved to PM clock helpers
> for clocks described in device tree, while regcache state handling remains
> in the codec runtime PM callbacks. This keeps register cache synchronization
> explicit in the driver and lets runtime PM drop codec clock votes when the
> macros are idle.
> 
> The series also keeps WSA MCLK-output clock registration resource-managed
> by switching it to devm_clk_hw_register(), which allows the empty WSA remove
> callback to be dropped.
> 
> Changes since v7:
>   - Dropped va_macro_setup_pm_clocks() helper in the VA patch and inlined
>     devm_pm_clk_create() + of_pm_clk_add_clks() directly in probe, matching
>     the WSA pattern for consistency.
> 
> Changes since v6:
> - Dropped the now-empty WSA macro remove callback.
> - Sorted the VA macro pm_clock.h include.
> - Re-sent as v7 with proper cover-letter threading after the broken v6
>   resend was accidentally sent as separate threads.
> 
> Changes since v5:
> - Rebased to current linux-next/master and regenerated as a standalone
>   series that applies cleanly.
> - Added depends on PM_CLK for SND_SOC_LPASS_WSA_MACRO and
>   SND_SOC_LPASS_VA_MACRO since PM clock APIs are used.
> - Improved runtime-PM probe/resume unwind handling in WSA/VA error paths.
> - Kept runtime autosuspend delay at 100 ms in both PM-clock conversion
>   patches.
> 
> Link: https://lore.kernel.org/r/20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com
> Link: https://lore.kernel.org/r/20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
> Changes in v8:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v7: https://patch.msgid.link/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com
> 
> ---
> Ajay Kumar Nandam (3):
>       ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
>       ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
>       ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output


Thanks for the patches, We should the same to tx and rx macros too.
For this series, I have tested it on my T14s

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
>  sound/soc/codecs/Kconfig           |   2 +
>  sound/soc/codecs/lpass-va-macro.c  | 129 ++++++++++++++++++-----------------
>  sound/soc/codecs/lpass-wsa-macro.c | 133 +++++++++++++++----------------------
>  3 files changed, 122 insertions(+), 142 deletions(-)
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260623-xo-sd-codec-v7-b4-8769da3a41ad
> 
> Best regards,
> --  
> Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> 

