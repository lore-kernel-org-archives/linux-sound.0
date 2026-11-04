Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776280;
	b=vTBN2tSHJmCyQdrKmRjf+h0h0tRedi84GJrsQxxyx6Sc49Levi/0Whdb8itKTbaQKtck
	 Q84Uj/XowBTO2qRXAH+If9oE/R5+T8Z0QKTmenGzNbUFOK0AYjQkuXmNeScopYQxpthKN
	 7jWHM1Qo4mKCSDdJhV9bJ4HEBCu55CCAipIRJl6OwY6xNtquLdVoBkjfEkoQwDsUGTtXz
	 0U4e2rBozCHbVWwhPqE7RueD7Eba3caBhuIg9Ja/B3W/b5KWHXHfaqI+ragF/3B29u6lJ
	 JLQBmoyYgB0B5tTnkQqkTXn7rplsieWfdqDVKcxJUvg31KXtFC0FyLH016nxVB7Pz6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776280;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XFWiyBwup5GdneAKx1ZdFgv+L+KeTK9B8NaYLti/HIY=;
	b=1Yt6Is3urTQyUBLZdX0XqW8+2Fc+AN/lZsa1HA1hHDxnHj73qOaG6JrqvTofd6IiTZsy
	 i+O+OWQ9pJcpVg4+O5k6skyZBBYTny107F2ixTEetwcSW9Ouy2VShqWndurnW2aCOxucK
	 /iwPPNbGKDaqURaXC+VL8NmYNYXIJc3Ng551iPUAO0gOk7Rzgm7HcZu1EdwLjbXLQ6/f9
	 ZV2866H9A4gaaiU+6pNJntTqeRn17csV12mMFW5eIaeH26FRK/pAd0RDa1Ixnn98Xv55Z
	 l9oa4myITBvAR1SEcMyiGmhVZ4tD7V5H2XV8RkWwOL3zIOX6mRauzj2mXLRi1e1x1jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEwxq9sw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51B606A31B
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 07:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEwxq9sw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E538A1F000C1;
	Wed,  4 Nov 2026 07:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776279;
	bh=XFWiyBwup5GdneAKx1ZdFgv+L+KeTK9B8NaYLti/HIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEwxq9swpgcZupTBESykaxrJqH0QTjXfUrUS16KOqKpJErw8GrGcP7FwFNhlweozL
	 xgZJfZ0MOLq4jYhOUOkcQ0O0pw7n8E0ak6rt1BztsUgjCXlRUdropXoAmr+TYf0oJ8
	 nCHMuzqj29mj+eJ/OOCwZqMYlp7ypKrF5kzO7huASZgXSZQ966vfwTlVQvulEAUQ/w
	 mLlaJrH7ievyVP8GLrMyaCEf6YU7TA4Rmqzu+79CC8jiMMzrdX+NPp6OU+XXHmlJgy
	 xMNFgKOL1yxmCy2tzaRy0lCLI+LupdXzk6QlT9yrb0IGjwAmKaNcO8OiplaIqg6Ns/
	 yYQPaQryxq3hQ==
Date: Wed, 4 Nov 2026 08:11:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH] ALSA: caiaq: free the EP4 URB when input setup fails
Message-ID: <20261104-calculating-bronze-mouse-e27ae0@quoll>
References: <20261104025341.1527407-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104025341.1527407-1-vulab@iscas.ac.cn>


On Wed, 04 Nov 2026 02:53:41 +0000, Wentao Liang wrote:
> The three controllers that use the EP4 input URB allocate it before
> checking the endpoint type and before registering the input device. On
> failure they jump to exit_free_idev, which clears cdev->input_dev but
> leaves cdev->ep4_in_urb set. The card teardown then calls
> snd_usb_caiaq_input_free(), which returns early because input_dev is
> NULL, so the URB is never freed.
> 
> Release the URB before dropping the input device on the error path.
> 
> Fixes: 6da7a2aa899f ("ALSA: usb/caiaq: Add support for Traktor Kontrol X1")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  sound/usb/caiaq/input.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof




