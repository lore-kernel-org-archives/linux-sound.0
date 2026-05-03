Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7299D394792;
	Sun,  3 May 2026 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826002; cv=none; b=W8+9M0aV8xfUtb7llvvmu9IT0u+nyHod3FvLMOy6Z5PkwqtxU/nP0Z0jFV5ScqOFThk5nViPEyt8zj6N+l/FCEU6DCGcQs3MfsyihEJw45+PcmisszknSQ5h62ZtOzHKpD0GaxlhX0jXj4zx0oZIjZmY//JGYIjKZiFA6f4cWeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826002; c=relaxed/simple;
	bh=2EYKW/lQEBA4POyGMD7xceci+2Vl3M6H46WcyLY+4nA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NVfDsRdKrr5KHldSQLfy3nhmbweFid4+rQsvS0PJ4m0VQbBkWuHBCxzOXz85IzKj3RRhQpUA06yuOY+XZd8aJfXqFm4k88OgVNY0UrwCjhn2NHF7Dky8NNm06yjV94jwrGaBexzQrio7mZRcxEIwNkSjm4TiJYgcRCSPgrd6RM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRbTGNxt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRbTGNxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B796C2BCF5;
	Sun,  3 May 2026 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777826002;
	bh=2EYKW/lQEBA4POyGMD7xceci+2Vl3M6H46WcyLY+4nA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XRbTGNxtS2qb31PfVBzhF++KkHx6pxA0GjvRIZ0ZukF7ayeZoY4+CE3gOQeLedbeE
	 uWb2PS9vEb/WWpIlYBSFBjiolrJGsG/VnY31IzQogAzaCUMNxy9TAO3jvOvFIOu9m6
	 lSTOrsJqsODaRdkG19l8M8wSOyOuXDz7FIvo+plBAXJlMwHgwRzg1ZRRbdol55/2pV
	 vKZx1Tem+J5p20H6lfNJasY1HKO2rJaUJZRizehtGBJrJH0rSmlv56QAI0kwAaCaEf
	 7Zx7u1/zEb5M6LSo+GobfaNXVpcC1mavuKcWgi48lgy63Zkq0X0KFTQ0p+gaLiMtBe
	 995xFdIYUgT+w==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260403183504.4-soundwire-compatible-pengpeng@iscas.ac.cn>
References: <20260403183504.4-soundwire-compatible-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] soundwire: validate DT compatible before parsing it
Message-Id: <177782599992.108644.1087363246524228067.b4-ty@kernel.org>
Date: Sun, 03 May 2026 22:03:19 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 03 Apr 2026 14:55:12 +0800, Pengpeng Hou wrote:
> `sdw_of_find_slaves()` fetches raw `"compatible"` bytes with
> `of_get_property()` and then immediately parses them with
> `sscanf("sdw%01x%04hx%04hx%02hhx", ...)`.
> 
> Live-tree OF properties are stored as raw bytes plus a separate length;
> they are not globally guaranteed to be NUL-terminated. Validate the
> first compatible string before parsing it.
> 
> [...]

Applied, thanks!

[1/1] soundwire: validate DT compatible before parsing it
      commit: 45c7bda7b7440183850012153988e40b300f40d0

Best regards,
-- 
~Vinod


