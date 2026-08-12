Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C193B2FDB;
	Wed, 12 Aug 2026 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534057; cv=none; b=Yh1VdCN6NBfrWyVNJJhhXKePqnWEWBzmmKMDq07DHEKAWdT0Ad6J7d3NeT32fsNzA9Jcl5JW3YSnKsaCe4iMcp4H9txPMQFEb7i60V6OFQsz47aQxQTyrWynD65+yOHhh+LnUFPrJvoPpXZftLYTWGT/pwpIbJ/dXn6cWGK8nh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534057; c=relaxed/simple;
	bh=oyzTTKiySLj119K7/JdI0HQJBKGu2ZzQCDXP80L3xVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tItbcaAMgygPQCZnOPKe8xRgspMcvNVEj5gzA/u5hnzxnTBDArAF1QDdzDZY8LY+liPyQU+Bgx5DVvdUc6BFs4aiX3Ad6/2EABJ5LZSCVm/E+sMinSUJhYyZufgw3c2Yc3LoSvZ/zHyNQFvLbvRcl1ZnqhYZDJblPsPispyxdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Scg2/A4c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Scg2/A4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAAD1F000E9;
	Wed, 12 Aug 2026 11:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786534053;
	bh=yMMXC24X+oZTBTzqcp0MGi2kRqIuXyKpc2ZZ7qaIYJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Scg2/A4c8BQMizWZgfIBJ7SBMPLMmElpQVCl1aW4ZKgKQpS+DW0onkZTU5G5DkAWj
	 VZKSdxLsfpig3HtJg1eXDW2Ywh79DrF5wCh9XurXjlN3K5n7OS7LTonI9mpeyC/PCv
	 18oq3swfsDUgQD7i5vWxMFcGDjsc/nyNgU9tzogv374TwD+w3Cq+wAaTSUwR4NTtd1
	 OG6PrCwBuizshv0xvTD8o7zuNc4svWYEsNJ9zZ4jof/yRHah8sb8d+yITzWID3h9GL
	 7q7XdJRL+jgEbnaru4IBUS1fZ9wFk2JJWnN0gZwQIAiySqYzHTVyhG8KHme+9xtaOw
	 EReCyDZ97TyOw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, mfd@lists.linux.dev
In-Reply-To: <20260805120109.4024451-1-ckeepax@opensource.cirrus.com>
References: <20260805120109.4024451-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH] mfd: cs42l43: Fix regmap defaults ordering
Message-Id: <178653405218.1365639.8547031800579791398.b4-ty@b4>
Date: Wed, 12 Aug 2026 12:27:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 05 Aug 2026 13:01:09 +0100, Charles Keepax wrote:
> The regmap defaults should be ordered as binary search is done on the
> array. A few registers were added in the wrong places, move these to be
> in register address order.

Applied, thanks!

[1/1] mfd: cs42l43: Fix regmap defaults ordering
      commit: 9d0e4b1ae5b045a2c92b0b9a1c3b268191c219d9

--
Lee Jones [李琼斯]

