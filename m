From: Balaguru Nallathambi <bala@ats.com>
Date: Fri, 15 Jan 1999 19:11:42 +0000
Subject: Re: SoundBlasterPCI128
Message-Id: <marc-linux-sound-91641748726022@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91584820831233@msgid-missing>
In-Reply-To: <marc-linux-sound-91584820831233@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Thanks. I guess I had the wrong patch (2.0.36*patch*) applied.
That's why the ES1371 driver did not show up.
THe 2.0.34*patch* has the ES1371 driver.

I have one more problem.
I have slackware dirstribution of LINUX which has gcc2.8
I guess to compile the 2.0.36 kernel with the patch applied
we need gcc2.7. I could not compile the kernel with my version
of gcc2.8. 
Is it possible or valid to apply the patch to a newer version of the kernel
source say 2.1.99 ? Will this compile with gcc2.8

Thanks,
-)Bala.




At 02:23 PM 1/15/99 +0100, you wrote:
>>         The problem I have is that I cannot see the ES1371 driver in the
>> kernel configuration options. So I did not even make the kernel.
>
>You need to enable CONFIG_EXPERIMENTAL
>
>Tom
>
>
