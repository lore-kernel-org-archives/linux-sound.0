Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815087;
	b=nGYLj8x8R3CLKMtTRurHBOgVwKMFZBf8cxIhIDv+6fQfqSe5TjN/vsMRoaqNT1rAutx6
	 LJji9e8aVRqxPVn85QKKCz2TnIpEQyh3uUXwyPAP9rdueQkXyU8uczDE8CRltTz1h+lgi
	 MdrzNMC83YJ1iafitfoXgOYjiZ+DYc7GFQKo3WZ3mRTg4Nc65q0HYRC88EqmN4gvxsUpv
	 Midf8VlNpZLkRcrpSzZaI0jMYflfqpsPM/cpy95AtteJlTpuT7gpcqM0zFqPOAxuObVp7
	 bOWZCUa9Edp2JdcECpZaPNhgN6pVhWZWCvKqYsSWtSx+PzCQDxfbOoETQQftag+ILPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=koh32cUIrtew3rQaspH6qQBq7QxbIkEWNYbNzJo79jE=;
	b=HCjJoMzknRrT1mPnkQZmI7fbOZGca2FHJ1GGMI2Fk9Z9818AVu2JGEtdwqVBBuwbQzRw
	 4sQrRx/3JFZFllR4MtNkkqpKwIEi0wI0SCRGNVXsTpx1ivGPjJGv8KfdK/NirOPlZJW0N
	 /KCYsZS0PM5VS4ouNLord49c0dVn+JqLOjNqOTzGBBkj8lQYyIaYQyw9yVQM44jQe2qeN
	 57BA+ClATCLwtioK1NVvUJ/cmVtpeB3XOYc/ISeXamC+No+8/9d9t02hmSHz8xfZRplzv
	 qjSNeBaS4bky/Xn06y6MFdug4jWjvLBaIVTT52WikMJikOp6vogr6ZD2ZisiyZZqxbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bt1i5pzI;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8D606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 07:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bt1i5pzI
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492f563d1c6so1194320f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815085; x=1795419885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koh32cUIrtew3rQaspH6qQBq7QxbIkEWNYbNzJo79jE=;
        b=Bt1i5pzINhDkBuOc7F4P+/bv8w65pEMO+kByL8f+l9sIqK+zjkDTlYHK2dLWXQNsER
         YicPzGglqWPB7yjtwDzbviIr8FmCPLA2P1dgw0WaGQd1A3QH7Wt+JuLvlIr5IXUwfMCs
         47jptj4udH4A7i7OSTKkODZ/nS9tUK6hGIxpfVwpWX90XXbYbO7LPSra/HulJ896X8TM
         Chs2NUN/aiGZqpqXX01iTMDN7SqBIO5NJ0M07fj1XEJATX3/8T6lrnJT64Jc3705083s
         rfGeYN/gbEbxPGnTY4ZHLPoPrR+R14f6sZ+3tlZS6JP07JGF013gdUGMGeGphRXcLiHJ
         IHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815085; x=1795419885;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=koh32cUIrtew3rQaspH6qQBq7QxbIkEWNYbNzJo79jE=;
        b=l2MBAdMCYICucrpSbI9P30rorA7bf4zOnYAeo3OEPj4zMvEeqtpREqPiEOXlrAEkru
         ukcuwvEwQq+nFTiNJyOO63i+dkvsrD1GthruszUOT+T8CnfPYkHJCLcm4klJju5eB65i
         qEFqxf9kbBp6pU/i5mXzRvIEQiXTDHNIS0PLnJhr9nCMS/FAZKz6Txw3xGb2WeBBVUSi
         ivmTQAf9TOP019HNmszVjPlzzD+spadmgNNR9OC0cvv70eIfp0IyujHuIqKHTtXQFyzq
         evrcAeACfKTxRtExzXmb94WOYtIFH+XyShlAR0MrVkMcYTzj6/mvWNL5XQbka2B4llVh
         ah4Q==
X-Gm-Message-State: APuU4Z/H3NPpEsvXMcWf+yF1MrcUFgAcNLPYCDxVK1hbZPqztPnGVI4Y
	JBZ582Q+mgyowAJy2SyX8OgZDWUQ4LF8rZDT2GEeUqvnMyjTvqBcHH6pLiKRssedmLw=
X-Gm-Gg: AYBFou2XyfzIbLNYW+SOxaddJLgWsVgp3NFqQZaoWOsmDeKcTpQRYOreiiewZp5T51I
	TytOrRMny4863ahaE0VKMW/07c8PjkXz89Ei2/DQy5pmszBEHn/Qyh4lt046YV9bAga5RilS48U
	bjY1zJ2Ki1HUABuI0FDOP+4Hxa2to++KbuhgJ2kA5GO351E29Kh93/yHfrwMF4dkr7yAd+ykg2T
	WdrtBV5SP3abG/ynwCANMDWGqvgi3zQihCymbs2KRfBFJVA7YdrDyl4GBa/oROswTdxfVj1Uqsd
	b5AqnVfdVcdBnN5alSoVXV/cINW5Ma0cdAQfvmFAJ5/blKXHLlqkvjnIb73afp98P7LSia+CwjS
	2ZjVmunBCMsa1BHxkvOJCtzb7vo5DMGNRFMMNgRI1G6NJxV+2Mzh5eP8zyOkuosd97bbKutl3Ue
	20JmuLYvgFIBOT5/ISELoFTzSP7SarOu+LI4rIC8K5GXcT2BjkhzfezxV5EMJ7tH5K1AJLY7jYl
	KEXHABGBDv/s/v2B0Yi1dN/b4TanzuXuFcChh+taMDlyzG1j1sqae519P3hwRjomX4IEERJcwzT
	FsEOXwRZUGpetjByHTHAjkwrK0+ZqyGxqodIEDK9KCeGV4GGa7Nkj8R9uE0fsNkVzXto63GTntf
	Xwcb1LTufZQ==
X-Received: by 2002:a05:6000:470b:b0:492:8dd4:baf8 with SMTP id ffacd0b85a97d-49c6d453907mr20718771f8f.6.1794815084882;
        Sun, 15 Nov 2026 23:44:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm18538106f8f.27.2026.11.15.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:44:44 -0800 (PST)
Message-ID: <708d758b-14ee-4a00-a9c6-6bd8bae8063f@linaro.org>
Date: Mon, 16 Nov 2026 08:44:44 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 02/23] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-2-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213528@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213528@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] clk: qcom: missing pm_clk setup for iface clock in
>    lpass_hm_core_probe()
> - [High] clk: qcom: wrong DT clock index for BI_TCXO in
>    lpass_core_cc_parent_data_ao_2
> - [Medium] clk: qcom: missing driver unregister on error in SM8650 LPASS
>    init functions
> - [Medium] clk: qcom: wrong postdiv clk_ops and user_ctl_val for
>    lpass_core_cc_dig_pll
> - [Low] clk: qcom: dead code, unused declaration, and unwrapped pm_ops
>    in SM8650 LPASS
> --
> 
> commit b45bde29cb5ec941ad6de37d77c22a656fbda080
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> clk: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds clock and power domain controller drivers for the SM8650
> LPASS HM, core, audio, and AON blocks when running without ADSP firmware.
> 
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lpassaudiocc-sm8650.c
>> new file mode 100644
>> index 0000000000000..636ce9a1b3451
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
> [ ... ]
>> +static struct clk_rcg2 lpass_aon_cc_ext_if1_clk_src = {
>> +	.cmd_rcgr = 0xb004,
>> +	.mnd_width = 16,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_audio_cc_parent_map_0,
>> +	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_aon_cc_ext_if1_clk_src",
>> +		.parent_data = lpass_aon_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
> [ ... ]
>> +static struct clk_rcg2 lpass_aon_cc_tx_mclk_clk_src = {
>> +	.cmd_rcgr = 0x1b004,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_aon_cc_parent_map_0,
>> +	.freq_tbl = ftbl_lpass_mclk_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_aon_cc_tx_mclk_clk_src",
>> +		.parent_data = lpass_aon_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
>> +		//.flags = CLK_OPS_PARENT_ENABLE,
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
> [ ... ]
>> +static struct clk_branch lpass_aon_cc_tx_mclk_clk;
> [ ... ]
>> +static const struct dev_pm_ops lpass_audio_cc_sm8650_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>> +static struct platform_driver lpass_audio_cc_sm8650_driver = {
>> +	.probe = lpass_audio_cc_sm8650_probe,
>> +	.driver = {
>> +		.name = "lpass_audio_cc-sm8650",
>> +		.of_match_table = lpass_audio_cc_sm8650_match_table,
>> +		.pm = &lpass_audio_cc_sm8650_pm_ops,
>> +	},
>> +};
> 
> [Severity: Low]
> This isn't a bug, but the `.pm` assignments in `lpass_audio_cc_sm8650_driver`,
> `lpass_aon_cc_sm8650_driver`, and `lpass_hm_sm8650_driver` do not use
> `pm_ptr()` (with `RUNTIME_PM_OPS()`), so the `dev_pm_ops` structures are not
> dropped when PM is disabled.

Will fix

> 
> Also, `lpass_aon_cc_tx_mclk_clk_src` has a commented-out `.flags` line, the
> forward declaration of `lpass_aon_cc_tx_mclk_clk` is unused because the
> following clocks reference `lpass_aon_cc_tx_mclk_clk_src`,
> `lpass_aon_cc_ext_if1_clk_src` uses `lpass_audio_cc_parent_map_0` instead of
> `lpass_aon_cc_parent_map_0`, and `lpass_audio_cc_sm8650_probe()` and
> `lpass_aon_cc_sm8650_probe()` duplicate the same `pm_clk` setup.

Will fix

> 
> [ ... ]
>> +static int __init lpass_audio_cc_sm8650_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = platform_driver_register(&lpass_aon_cc_sm8650_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return platform_driver_register(&lpass_audio_cc_sm8650_driver);
>> +}
>> +subsys_initcall(lpass_audio_cc_sm8650_init);
> 
> [Severity: Medium]
> Does `lpass_audio_cc_sm8650_init()` leave `lpass_aon_cc_sm8650_driver`
> registered if registering `lpass_audio_cc_sm8650_driver` fails?  When built as
> a module, failing module init without calling
> `platform_driver_unregister(&lpass_aon_cc_sm8650_driver)` leaves a freed
> `platform_driver` structure linked on the platform bus list, causing a
> use-after-free.  `lpass_core_cc_sm8650_init()` in `lpasscorecc-sm8650.c` has
> the same issue with `lpass_hm_sm8650_driver`.

Will fix

> 
>> diff --git a/drivers/clk/qcom/lpasscorecc-sm8650.c b/drivers/clk/qcom/lpasscorecc-sm8650.c
>> new file mode 100644
>> index 0000000000000..4f91ab0d772ec
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpasscorecc-sm8650.c
>> @@ -0,0 +1,509 @@
> [ ... ]
>> +static const struct alpha_pll_config lpass_core_cc_dig_pll_config = {
>> +	/* 614.4 MHz */
>> +	.l = 0x20,
>> +	.alpha = 0x0,
>> +	.config_ctl_val = 0x20485699,
>> +	.config_ctl_hi_val = 0x00182261,
>> +	.config_ctl_hi1_val = 0x82aa299c,
>> +	.test_ctl_val = 0x00000000,
>> +	.test_ctl_hi_val = 0x00000003,
>> +	.test_ctl_hi1_val = 0x00009000,
>> +	.test_ctl_hi2_val = 0x00000034,
>> +	.user_ctl_val = 0x00000000,
>> +	.user_ctl_hi_val = 0x00000005,
>> +};
> [ ... ]
>> +static struct clk_alpha_pll_postdiv lpass_core_cc_dig_pll_out_odd = {
>> +	.offset = 0x0,
>> +	.post_div_shift = 14,
>> +	.post_div_table = post_div_table_lpass_core_cc_dig_pll_out_odd,
>> +	.num_post_div = ARRAY_SIZE(post_div_table_lpass_core_cc_dig_pll_out_odd),
>> +	.width = 4,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
>> +	.clkr.hw.init = &(struct clk_init_data){
>> +		.name = "lpass_core_cc_dig_pll_out_odd",
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&lpass_core_cc_dig_pll.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_alpha_pll_postdiv_lucid_ops,
>> +	},
>> +};
> 
> [Severity: Medium]
> Should `lpass_core_cc_dig_pll_out_odd` use `clk_alpha_pll_postdiv_lucid_ole_ops`
> instead of `clk_alpha_pll_postdiv_lucid_ops`?
> 
> `lpass_core_cc_dig_pll` is a Lucid OLE PLL, where the FSM vote bit lives at
> bit 25 of `user_ctl` (`clk_lucid_evo_pll_postdiv_set_rate()`), whereas
> `clk_alpha_pll_postdiv_lucid_ops` checks bit 20 of `mode`
> (`clk_alpha_pll_postdiv_fabia_set_rate()`).  In addition,
> `lpass_core_cc_dig_pll_config` sets `.user_ctl_val = 0x00000000`, so
> `clk_alpha_pll_write_config()` skips writing `user_ctl` and never programs the
> odd post-divider or output enable bits during PLL configuration.

Will fix

> 
> [ ... ]
>> +static const struct parent_map lpass_core_cc_parent_map_2[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 1 },
>> +	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 2 },
>> +};
>> +
>> +static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] = {
>> +	{ .index = 1 },
>> +	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
>> +	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
>> +};
>> +
>> +static const struct freq_tbl ftbl_lpass_core_cc_core_clk_src[] = {
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	F(51200000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 6, 0, 0),
>> +	F(102400000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 3, 0, 0),
>> +	F(204800000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 3, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 lpass_core_cc_core_clk_src = {
>> +	.cmd_rcgr = 0x25000,
>> +	.mnd_width = 8,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_core_cc_parent_map_2,
>> +	.freq_tbl = ftbl_lpass_core_cc_core_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_core_cc_core_clk_src",
>> +		.parent_data = lpass_core_cc_parent_data_ao_2,
>> +		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_ao_2),
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
> 
> [Severity: High]
> Should `lpass_core_cc_parent_data_ao_2[0]` use `.index = 0` instead of
> `.index = 1`?
> 
> `qcom,sm8650-lpasscorecc` only has a single DT input clock (`bi_tcxo` at index
> 0), as used by `lpass_core_cc_dig_pll` and `lpass_core_cc_parent_data_0`.
> With `.index = 1`, parent 0 of `lpass_core_cc_core_clk_src` cannot be
> resolved, so `lpass_core_cc_core_clk_src` and its child branches report rate 0
> when parked on `bi_tcxo` via `clk_rcg2_shared_ops`, and requesting 19.2 MHz
> fails with `-EINVAL` in `_freq_tbl_determine_rate()`.

Will fix

> 
> [ ... ]
>> +static int lpass_hm_core_probe(struct platform_device *pdev)
>> +{
>> +	return qcom_cc_probe(pdev, &lpass_core_hm_sm8650_desc);
>> +}
>> +
>> +static const struct dev_pm_ops lpass_hm_sm8650_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
> 
> [Severity: High]
> Does `lpass_hm_core_probe()` need to set up `pm_clk` and add the `"iface"`
> clock before calling `qcom_cc_probe()`, like `lpass_audio_cc_sm8650_probe()`
> and `lpass_aon_cc_sm8650_probe()` do?
> 
> `qcom_cc_really_probe()` with `.use_rpm = true` only calls
> `devm_pm_runtime_enable()` and `pm_runtime_resume_and_get()`; it does not call
> `devm_pm_clk_create()` or `pm_clk_add(&pdev->dev, "iface")`.  Without that
> setup, `pm_clk_resume()` and `pm_clk_suspend()` in `lpass_hm_sm8650_pm_ops` do
> nothing, leaving the LPASS HM interface clock unacquired and potentially gated
> when `qcom_cc_really_probe()` and `gdsc_register()` access the HM registers.
> 

Will drop PM


