Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E72D46B3;
	Thu, 29 Jan 2026 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715243; cv=none; b=tZb8bJuYOxMm4OkLj0YjxqLicZME2xTYRZgKVKkWa0BW9JupP7qhQeRvNdjFWF/Dq0SX0sfpWiFgm3rN5aUXhm10favyTdbSGt+LB5S4sIHQfiK/ImpSnvOmmIlSttsI+rlFjPgJAGHlPBpY5Dbc08++kSQGxt6Z1KEEFn30PBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715243; c=relaxed/simple;
	bh=1vgbhUHHRTHSrfqkk3jGB9YcpPGw0fIlySYPcWZHiB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwNbwN1/ajFY8g57XqqU1xQjKdk0/XxmbUDuMhLLFkT1IT6kfBq3l5vwlOiR7kGdR/MKVayUTiqfBtCylTvx+xxn0zYOLPTao+sua0Vv40uB/KzPoJbYhijtdwlBSL3fsXovRAQPbfc8ssSjR8flv52/ez379RzxpP5nVEfwa5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4jGOylK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4jGOylK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65065C4CEF7;
	Thu, 29 Jan 2026 19:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769715243;
	bh=1vgbhUHHRTHSrfqkk3jGB9YcpPGw0fIlySYPcWZHiB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D4jGOylKOYbukosPsNu7t1/HcqzUjXGzvx27vh0Q1UQIyuEeWXm/6xyUXyFUtEjJh
	 KL+TCjd8C7v4WY+Eh8un/mR4OA1pPBGhCuDI2w1WVBlT4HSooarSn6q7eb2rrQA2Jo
	 RZ14YSHzDnmonTb0vZOklIVxuQYsabv2OBccHPjx1XVAJxVsv3KPxS6M8XxsYFiL3f
	 gtgrpogy8E4JXdeBWKbFflPJnmfmxVXiBi69JIvkiYRUbhC32qAw4zj2XFQ/YbGv9g
	 W7kBMjQOy4AHfj2YMZYUCL8crnX98UpG2ci9LBsi0HKA6eR0fsxeBtn+dcwereeUCi
	 bgO38bqsGRZ/w==
Message-ID: <39c2e480-cfb5-4f31-9ebc-df769d1cdc73@kernel.org>
Date: Thu, 29 Jan 2026 13:34:01 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] soundwire: amd: clock related changes
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260129061517.38985-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/29/26 12:14 AM, Vijendar Mukunda wrote:
> Refactor clock init sequence to support different bus clock frequencies
> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
> 6Mhz with different frame sizes.
> 
> Vijendar Mukunda (2):
>    soundwire: amd: add clock init control function
>    soundwire: amd: refactor bandwidth calculation logic
> 
> Changes since v3:
> 	- drop unnecessary debug logs.
> 
> Changes since v2:
> 	- Update commit message
> 	- add comments in the code.
> Changes since v1:
> 	- Update Cover letter title.
> 	- Fix typo error in commit message.
> 	- drop unnecessary condition check in compute params callback.
> 
>   drivers/soundwire/amd_manager.c   | 109 +++++++++++++++++++++++++++---
>   drivers/soundwire/amd_manager.h   |   4 --
>   include/linux/soundwire/sdw_amd.h |   4 ++
>   3 files changed, 102 insertions(+), 15 deletions(-)
> 

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
