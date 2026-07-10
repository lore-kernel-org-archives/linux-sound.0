Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237EF3E1689;
	Fri, 10 Jul 2026 22:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722082; cv=none; b=TYi8DUeIXaGcM4tvQTPZNBBIuBBt4PrIqOliHLlIXA0qelYf1Y0rc526FEcA2feB34MMiWkfdnWb7WscsYIh6kq5himmllhkQjnZE9SmPYnwdixirSBrKdzPahHtzmUf5d7edMP+hShd6yXx61+/XgZMTAR1LkUjutCfKl9Zvh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722082; c=relaxed/simple;
	bh=WpDWCNAyhxUQLxfP5zY3EqaGVflZolwFZ/V5KrO3doQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=twq1tUKaCl9s8g7lHqhfhvRfzL3Q9v8CQletbBR5Cmw9ldZp5SLUHBJ6R7AnPFbvD99lFnSRoOv4G60BjZBUcnjDGq6jLdyoKJ2PFjCGa5EcoM9DuuC53tbIjV1Z1Puli/kJMljh/jkxQUela/fQjGiVp/gHvarDzenXdoGQmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LA25AUVg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LA25AUVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D71B1F000E9;
	Fri, 10 Jul 2026 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722080;
	bh=5mrha8DhdpddOOfykOunGU3B8kcwAsqObviNCTlyzqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LA25AUVgeqxJBWBMu/Xu7LRiNf9CVtHO8NpqaXV3h6kF9bT5iVZoC6ou5y88SPYC5
	 9DrdrPmAeDQ+maffT5FiHykBEphJ5wpRtmM8X9FJNUj52rycTjzzoCghjEUYHvEmYg
	 EafBHG92NWEf7CXZ2Sw9j11jge/2sRn/EEDbZKTWumt6rWFpHLocqSZ3k22kHHxVPV
	 Y8A/MX4uIDAeGEMV3mSCl7Tfk6VB4Rudg1MZYjShI/m04NT/ZUrS/8n25XWD0DBBy8
	 TaSm2t2PmEjuxocsugcWcpH1DWeYOTx+7SaisKwj39rC6gW6wujF04E19BQLLl2fJC
	 dGeySXItvgSZw==
From: Mark Brown <broonie@kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 phucduc.bui@gmail.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260709043740.329504-1-phucduc.bui@gmail.com>
References: <20260709043740.329504-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2] ASoC: xtensa: Use dev_err_probe() and drop
 redundant error handling
Message-Id: <178368552263.82617.3903839452185413358.b4-ty@b4>
Date: Fri, 10 Jul 2026 13:12:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WpDWCNAyhxUQLxfP5zY3EqaGVflZolwFZ/V5KrO3doQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBecKXso8xT3EDIhjHrMNMVU8Qn49O71qoeo
 X24btmsw1mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwXgAKCRAk1otyXVSH
 0Ly9B/9tfjYrYWtgqp9OyqPqrb9TFed93eMx1CbAHK6a7u0Y12BgTQRKZomD6ncyXPyt0jlsMBQ
 QWHAFhMMTZIOW1LyLkXaUyrrl3bzwJimy9USy57u+j3kHb0tZ9z9xePiGFlbEetkKlh87oH758f
 bRu5I1nRr6ihmDEPvhTilfbIc+T7pHQmqKpaGEBG31YCVmCv09Jl7dfn5A4R0DZKDMFHiiF2gOQ
 gvSWx2CCBmGev1foqnPei26dqPCigBUZL6Gs7TSxHJnz1vyfxy864Vmm2lNlyrO/Z1l6kuKYS/o
 MHv1FKZgpw4VyAxitzPT3AzFleEw31XurGuUBcmNsSMG/FCy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 09 Jul 2026 11:37:40 +0700, phucduc.bui@gmail.com wrote:
> ASoC: xtensa: Use dev_err_probe() and drop redundant error handling

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: xtensa: Use dev_err_probe() and drop redundant error handling
      https://git.kernel.org/broonie/sound/c/92aa9c7b1d9d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

