Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716116D9AE;
	Fri, 27 Sep 2024 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727403008; cv=none; b=I5w67h190DZ2KvAUg+MhJGSfzq9c1MG6dZaRyPayp0vvTBzzL3gW7mjHnJaKfQeeiXH4vqoxGB9A+7npvdl3T8mfucZWPZ8AFJTSvY0kVwNPKAUc9i25rkHjGqTDBZUVVmgScnmdFsK2fOns7RJFQGfZ15cXKnyz2LU+LCYcffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727403008; c=relaxed/simple;
	bh=bRDDcD+o03ffd1dhPD/qxtKBBlnOK8itG0whlQOPq6w=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=MjdExDkO4H+Wk2RTQhgAWXMGoDN4Cx6MidnF0AYbZTG+4eWQOJ27k28588POeSV+JfHdxeLPi7T4L3FUQwgzEJbeqgs9+lY401USTmh2hZ0uBponzYKwnkCfN3k5fbx3K8AtMJkARuYGR3GZ+DPduZplCPXet/aP7e1+Zs0a+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfP+CkNc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfP+CkNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B20C4CECD;
	Fri, 27 Sep 2024 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727403007;
	bh=bRDDcD+o03ffd1dhPD/qxtKBBlnOK8itG0whlQOPq6w=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=JfP+CkNcKa5JRcLHADwAPiHd300pMB/xH0i69Mn2r2XFcuuERS4HdfQNpEejSYJq2
	 k6m5BG+8ZrToAifRyvkNEtCP64z11lJvy3XrxDycHwlE9RL5c2Luc3Cs0e+eZb+UqO
	 0j2mhR1crr9g+YscLTuKPd0JcUZxaDZIslGzEfxYNh8xM52SPZqc+fsOqwAPptmeue
	 dxc1bRHNTEhCdhIIO2NiyooqxX8quRSsjcN2WSx7nck8kcegHcowf+5q1Is1Rk1ZVa
	 b01py7eyII7P5TOBN4Mu210bykr8VtemAUldIHM7c194QE0ZorqLSqtVEaUrg4Urb7
	 J7Bms3I/tIZYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 39CD33809A90;
	Fri, 27 Sep 2024 02:10:11 +0000 (UTC)
From: abhishek via Bugspray Bot <bugbot@kernel.org>
Date: Fri, 27 Sep 2024 02:10:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, 
 bugs@lists.linux.dev
Message-ID: <20240927-b219303c3-01cd46af2ad8@bugzilla.kernel.org>
In-Reply-To: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
References: <20240924-b219303c0-b3829da31e15@bugzilla.kernel.org>
Subject: Re: Mute LED light is not working on my HP laptop
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

abhishek added an attachment on Kernel.org Bugzilla:

Created attachment 306923
Fix patch

Hi,
Is it possible for you to apply this patch at your end and once check?

File: hp-pavilion.patch (text/plain)
Size: 818.00 B
Link: https://bugzilla.kernel.org/attachment.cgi?id=306923
---
Fix patch

You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

