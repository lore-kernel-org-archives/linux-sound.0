Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513949;
	b=j+xsrm511eZSsdPu3yDeN9LEyyB3IPPMzDCsQt62Z0kzBc1fRwHoMuT8kFPqbvZs4HZr
	 SnXIbAcib1C98eMPqd9yWaeVeknJxlhj1X416UmzZkm3KvQCs5rCKlq6ODKZxoZUtK3Eq
	 xnoRLvgNWPh0TuOM2fOsvc6wqtRSsiLI2JESbE07O2pXT5x+Zx4ajKH88gZodobL2FicE
	 SczFOZuDIyItA06/pUVkx8gJkWgCUwdS5YH29NCdXDCSBbnJ74kHkb9eZmeZUIi7/txzP
	 N8S/hnRTofxXwn2DTKfaMpwipnD/bMGpBsvvVWZTmv5Ipfc3dnIwjcfUmwV+IswLyqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513949;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=FUfcFId2P1oZHWX5OThKm1oGTWtCID07XdMqjOhZL2Q=;
	b=pwBZrxTT08Djmt81PV2XI1hWlrmCCk9Xk7frCrHLHuql+6hwrEIAZpvp3Hqyxy02t7Ib
	 Yf8w0n39HVRFII/6uNwxaXc959YKOUFuoC+XSYloV7k6PWKwPfoIpOjYT4QpgQaSYFNpe
	 Gp8AsA4FZOhJV+Drqm83XdQvwncpRxl2P0RfzF+NL/iSAHp7LFE/6/JKxSp9GhZl1lv2J
	 3ccS+VsQIjbKllcxTTu1kI32Io+Pk8tT90mR+oa4t4VS/CiD4NKtZxcBtrTEcdm0xo1ZJ
	 vXHnIgX8ZSsGDGmxP2tDJRY/3V7hErNCaxM1dFDZOC8/kpZIR+YKdaW9Hckn7xXFLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a0e0/noM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D17606A33E;
	Tue, 24 Nov 2026 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0e0/noM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528DF1F000C4;
	Tue, 24 Nov 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513948;
	bh=FUfcFId2P1oZHWX5OThKm1oGTWtCID07XdMqjOhZL2Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a0e0/noMTN8MbxcrLW6+7L4vOTKhz/FgaqDsJr62xQ3dJuZGAmHRDNisMw188QQJM
	 5h4yFo2moqaH77B46hTP2X2eRUx0qGurCwkeL6XDiNqQNkNanB12KyxkwZAmHJCG9m
	 nxJ7hkNWKMmcaWwFbwYtiAjMFdBEKA/zjOGGU6B+YkxDH3gImeMAAe7gzN4q4fIO24
	 5vdmWcWIjtMeCQh/OT8dfnMTEk6gSXBXadRqyd60s3s4ccCVzxV+MAFGZuWt2QQFdY
	 9V0te1e1KhopQqFUCJOQ6MK39J7iBE7hCPB5XM75x/gpkMj1P6h+eKhoR4w3rIvm+w
	 rIp8Z/GCQOqFA==
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 HyeongJun An <sammiee5311@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20261123075522.405347-1-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
Subject: Re: [PATCH v3 00/10] soundwire: Fix Critical and High issues
 reported by Sashiko
Message-Id: <179551394598.362684.13493861476808483469.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 15:22:25 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 23 Nov 2026 07:54:21 +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> Patches 1-3 have been hardware-tested on Intel Tiger Lake / Cirrus Logic
> systems by HyeongJun An and Charles Keepax; the remaining patches have
> been build-tested only.
> 
> v2 => v3:
>  - Rebase onto soundwire/next
>  - Collect Reviewed-by and Tested-by tags on patches 1-3 (Charles,
>    HyeongJun)
>  - stream: Validate slave port configuration and stream parameters
>    before mutating runtime or stream state on error paths
>  - qcom: Track newly allocated port_mask bits in a local bitmap so error
>    rollback in qcom_swrm_stream_alloc_ports() never clears pre-existing
>    ports
> 
> [...]

Applied, thanks!

[01/10] soundwire: bus: Hold bus_lock when looking up slave devices
        commit: 1cba791c9a1b34846d2c89da5220b5bdb8d32539
[02/10] soundwire: sysfs: Use sysfs_emit_at() in array show callbacks
        commit: 8a2544fb697472139c639b69d6ff1e4d0f9d9492
[03/10] soundwire: stream: Prevent m_rt_count underflow in sdw_stream_remove_master()
        commit: 9706b821199eed1189d7ec9b17625ca07abe5248
[04/10] soundwire: stream: Clean up allocated runtime resources on config failure
        commit: 8a681d3e04d6ddaee1412c53b6a5a9b4e01de69b
[05/10] soundwire: intel_ace2x: Protect bus.bpt_stream with bus_lock
        commit: b9a8ed1254978b14ab3cd3f7e5d39a0c8fe55173
[06/10] soundwire: qcom: Prevent pconfig buffer overflow in qcom_swrm_stream_alloc_ports()
        commit: d9ea256ee889f3db9f0bd07ce5d114ce92e31b4f
[07/10] soundwire: qcom: Disable runtime PM and avoid clock underflow in qcom_swrm_remove()
        (no commit info)
[08/10] soundwire: qcom: Check clk_prepare_enable() return value
        (no commit info)
[09/10] soundwire: qcom: Serialise ctrl->intr_mask updates
        (no commit info)
[10/10] soundwire: qcom: Prevent stale broadcast IRQ from completing subsequent command
        (no commit info)

Best regards,
-- 
~Vinod


