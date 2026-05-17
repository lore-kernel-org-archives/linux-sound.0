Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C5B1B808;
	Sun, 17 May 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034814; cv=none; b=WgsI5o78Wk4XSHfjCLm0ib73kEB0yYg2zinR2bcxk8wuBOwik0pcxJ0cIEnNkmetRV8qaym7bIe9O+TDvI5tJeNm4p6QqXBjKyURWR2EUcCpaAcstPOSNlV03MQhZvz+lTloMcizvtIMSkyrdbNeQt9Ug43UTKl4fStkK1sXY+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034814; c=relaxed/simple;
	bh=KH1mYRGQuryVzI4h0Dh6Rn/OjjkxNKL3dj8KlyyWRF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rmkRzb5EEo3hZgnn9aFJOsnBqW1QNE/ZYwd7JF5OOX1SowaqKwVZE+rrNdmZldnOwcsBXQkOIjAgpQJS2IaiQjm2vJdskJJSyZNedOjU2ii/Yax4cXZ/v4VnZg8WREqr2ZQhLfWJ8a6KzIqYfhuKOIvkfufeA6rEFfUJyZzgX7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hAh+j7tM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAh+j7tM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC332C2BCB0;
	Sun, 17 May 2026 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779034814;
	bh=KH1mYRGQuryVzI4h0Dh6Rn/OjjkxNKL3dj8KlyyWRF0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hAh+j7tMPue/NRW53t0Y4v3wlgyJiuQvJ6bNRGNPJj46ha0wk6lcMne1bEkb6Y9d7
	 xhKXF0AXqIIILKVn7vsCkoO7vFFw9iZo04HBmybECd3VAyCfsRmLEq0Tx8JyHNS8sb
	 y48A3E7xZxNsRiA8he+fmxbnsRgvFWCLEulusXZn89XEftwo9aUj7/xRVdl1GqNyyP
	 lfILEpvMt/k1S+q+P/Innq+w+AMbPwCxMcUOlu7CbPSZKaZ2b4txGlY8dIDYup1B9w
	 7p6XJxm9ZRBYeOPt9lOSvo1OqnbOtwcubs4DjyoKQRyW5wgP3U/PeabJ0+r5AhYj7X
	 ssagVnh5nVKHA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260514141625.1834216-1-yung-chuan.liao@linux.intel.com>
References: <20260514141625.1834216-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH RESEND] soundwire: intel_ace2x: release bpt_stream when
 close it
Message-Id: <177903481158.39935.3686849536391381410.b4-ty@kernel.org>
Date: Sun, 17 May 2026 21:50:11 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 14 May 2026 22:16:25 +0800, Bard Liao wrote:
> The BPT stream was allocated in intel_ace2x_bpt_open_stream(), we need
> to free it in intel_ace2x_bpt_close_stream().
> 
> Fixes: 4c1ce9f37d8a8 ("soundwire: intel_ace2x: add BPT send_async/wait callbacks")
> 
> 

Applied, thanks!

[1/1] soundwire: intel_ace2x: release bpt_stream when close it
      commit: 8a7fe10eec64bfb7cf4091bca540de4c55d56bfa

Best regards,
-- 
~Vinod


