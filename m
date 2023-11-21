Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AD1DA36;
	Tue, 21 Nov 2023 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4ss9v9y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4895C433C7;
	Tue, 21 Nov 2023 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700551510;
	bh=wvPq2fvMsOoXjcPnG6LjJGeeADn4tr7tslrl9RQJLco=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=L4ss9v9ybDG36I5q0O+aunA8W/B2zU1CJGJvI3EG03hHhfOzPiwdAQKosl32fHY/A
	 8x5mShfxfAZ9aKCDwtU2oX6cpWOMscfp47IR/nEyaQumzS3oBj98sBOQSAcgZqFsH9
	 +nk0Lq64ef2AVI3exOPoeCJtj44J+icVvaETyl3Qw9iJOuFgdeL4EIGXC4vm+K710x
	 7z/B4EMf/4YvK503N7oUszRVvsfAvtqUXW1g0cnv8KKLIeMACa5aO6M31pvXBq/g2s
	 GvOv9MKRgEyzHhyFS4iI7VI38rOvgGOWcbhvNgLY7pL6hlabRr+FEaWXsoOZaG/Kc/
	 0kEqdqBKa/OoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB752EAA955;
	Tue, 21 Nov 2023 07:25:10 +0000 (UTC)
Date: Tue, 21 Nov 2023 07:25:10 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tiwai@suse.com, linux-sound@vger.kernel.org, bugs@lists.linux.dev, 
 perex@perex.cz
Message-ID: <20231121-b216392c3-3d2c0b363b6b@bugzilla.kernel.org>
In-Reply-To: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
References: <20230331-b216392c0-c38b1eac72db@bugzilla.kernel.org>
Subject: Re: Asus ROG Zephyrus GX701L sound problem
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: peebz 0.1

rakic.iwan writes via Kernel.org Bugzilla:

Hello team,

Any update, please.

View: https://bugzilla.kernel.org/show_bug.cgi?id=216392#c3
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

