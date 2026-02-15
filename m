Received: from denise.shiny.it (denise.shiny.it [185.206.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A3255F28;
	Sun, 15 Feb 2026 22:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.206.84.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196393; cv=none; b=iV7Owp/YYm6hwlJ0waXmFuAzeg+weXu2nIjtOlJ/EB2Y8J3ZwarS2dya1kKJmMAsc1Dkm2PC/z7oc2Tseyg07IS24qyECXUtkHZ9ycRPzhpa05BtK5blY0WG7U2K41ERleNUGmPzFOdnThBuBDE6T6KTOrY/vrB3xFSA6ZuGqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196393; c=relaxed/simple;
	bh=eY/HWN/fHQ0Hi1+W/nbSINe3tKP3mgLfssucpF+mOwI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bEfoYo6m/YWUJUHf0eBRitegePEGbUbcQw5yQh6BH4haadVq5qKS05mssNLlGK4huSq2ysTvzFeGvvwCM0sbr9oS5nS/uPr2SqHidLlrwpKQ6bTyAOsvcoWYO7yDdjU+yhXav8uRh4Vyime3DFan6HQ2iSuUL70g4r0eeCtByjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shiny.it; spf=pass smtp.mailfrom=shiny.it; dkim=pass (1024-bit key) header.d=shiny.it header.i=@shiny.it header.b=UPVJ1m6w; arc=none smtp.client-ip=185.206.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shiny.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shiny.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=shiny.it header.i=@shiny.it header.b="UPVJ1m6w"
Received: from wc1 (localhost [127.0.0.1])
	by denise.shiny.it (8.18.2/8.15.2) with ESMTP id 61FMYW2S019837;
	Sun, 15 Feb 2026 23:34:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=shiny.it; s=mail;
	t=1771194874; bh=eY/HWN/fHQ0Hi1+W/nbSINe3tKP3mgLfssucpF+mOwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UPVJ1m6wnUyZZJDSdXPWRNI7P5rn0n9I4Ne7hcmzCzjaRtauano6LToei5PqFqbEG
	 NVT0uwggZvddl4VIdzl0Av709Ct1j0smO2CdBgbIO/NV8nY32nNRZ1IDo4oI8rD2Ft
	 LO6S6pqpNwDl4RTjbV89m11pcp8SwnAB8iG+8sbU=
Date: Sun, 15 Feb 2026 23:34:42 +0100
From: Giuliano Pochini <pochini@shiny.it>
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-spdx@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: echoaudio: Add SPDX ids to some files
Message-ID: <20260215233424.6bf9b377@wc1>
In-Reply-To: <20260212234928.3739815-1-tim.bird@sony.com>
References: <20260212234928.3739815-1-tim.bird@sony.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Feb 2026 16:49:28 -0700
Tim Bird <tim.bird@sony.com> wrote:

> Add SPDX-License-Identifier lines to some files in the
> sound subsystem - mostly in the echoaudio drivers.
> Remove boilerplate GPL headers.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>

Ack-by: Giuliano Pochini <pochini@shiny.it>



-- 
Giuliano.
