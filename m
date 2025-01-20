Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964944689;
	Mon, 20 Jan 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387069; cv=none; b=lOrmBzSDgGyZl2wV50YPL8GBG10Cpf+w8zoRbQyvLHX0FY25sgX0TeTwjN0g39+IdpHbzTcIBU9cz9d+fd1jkKb6boj8pr5r8d8Ufg4WpUNfHrLDr8kaQeQrQqhHM2aiAFZrWjTOuTepXTJxihqjfXYHrR7XvPnAtgGKS4cziW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387069; c=relaxed/simple;
	bh=TQpgB6KgvkARcWwudNBk86Uba6eC7LA4GwfNP28VwQE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y9jK4gGjnajuiir/Gday4TmeMXYOHQ631vH11OW5Nc3YApxxPpO/1XSTx87QPLCYAn96s8w+Fzglw9DLGvE0upFfGJUOqggoPBfubNaQPd8o5/xvN9OH40rM0rr9WqjeJiv2OT/LZd324BYUGXMpvCM020mgFeI8WonPGPlcJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ecEJ7gU8; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ecEJ7gU8"
Message-ID: <7e363634-b80f-4ae7-8d09-1bb07225eecd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737387063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2inTmLpoXCKi4QKCx6CF5haUkYgl9RHPMRrCAqx/1js=;
	b=ecEJ7gU8Q7q28GfUcgsiTNB14c+CzC12RxBMB3EuwN5zka+ntyZEPoy57i3eclQ7rEKPLJ
	z7mb1sJP5X9XagtnpFu+9is+YnxElytKNg6OSWQlSPelskVbLEPdYuou3kjaqvMpzC4IYv
	BTKemIshNN+Kc2/q5eFIgp90BMfTBIg=
Date: Mon, 20 Jan 2025 09:30:30 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH V2 3/7] soundwire: amd: add conditional for check for
 device resume
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
 <20250120101329.3713017-4-Vijendar.Mukunda@amd.com>
Content-Language: en-US
In-Reply-To: <20250120101329.3713017-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/20/25 4:13 AM, Vijendar Mukunda wrote:
> Add a conditional check to resume SoundWire manager device, when the
> SoundWire manager instance is in the suspended state.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 60be5805715e..6831b3729db5 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -850,7 +850,10 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
>  static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
>  {
>  	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
> -	pm_request_resume(amd_manager->dev);
> +	if (pm_runtime_suspended(amd_manager->dev)) {
> +		dev_dbg(amd_manager->dev, "Device is in suspend state\n");
> +		pm_request_resume(amd_manager->dev);
> +	}

Is this test actually doing something useful?

If the device is already active, presumably doing a pm_request_resume() is a no-op. If it's already suspended it does something.
Testing the device state is risky with all the asynchronous behavior in SoundWire, best to leave the state checks to be handled inside the pm_runtime core, no?

IIRC the only time when such a test in needed is in the system suspend callbacks where specific action needs to be taken if the device is in pm_runtime suspended mode with the clock_stop mode engaged.
